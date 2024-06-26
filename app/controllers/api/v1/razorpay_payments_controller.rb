# frozen_string_literal: true

Dotenv.load
require 'razorpay'

# Setup Razorpay with API credentials
Razorpay.setup(ENV['RAZORPAY_KEY_ID'], ENV['RAZORPAY_KEY_SECRET'])
module Api
  module V1
    # RazorpayPaymentsController is responsible for handling payments.
    class RazorpayPaymentsController < ApplicationController
      protect_from_forgery unless: -> { request.format.json? }
      before_action :set_subscription, only: :create_order

      # Creates a new Razorpay order and associates it with a RazorpayPayment.
      def create_order # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        order_attr = {
          amount: @subscription.price_cents,
          currency: @subscription.price_currency,
          notes: { key1: @subscription.name }
        }
        @order = Razorpay::Order.create(order_attr)
        @payment = RazorpayPayment.new(payment_params.merge(razorpay_order_id: @order.id, status: 'pending'))
        if @payment.save
          render json: {
            key: ENV['RAZORPAY_KEY_ID'],
            order_id: @order.id,
            amount: @order.amount,
            currency: @order.currency,
            description: @subscription.name
          }, status: :ok
        else
          render json: {
            errors: @payment.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      # Verifies the payment signature and processes the successful payment
      def verify_payment
        if valid_signature?
          process_successful_payment
        else
          render json: {
            error: 'Signature verification failed'
          }, status: :unprocessable_entity
        end
      end

      private

      # Only allow a trusted parameter "white list" through.
      def payment_params
        params.permit(:subscription_id, :name, :email)
      end

      # Sets the @subscription instance variable based on the subscription_id parameter
      # Renders an error JSON response if the subscription is not found
      def set_subscription
        @subscription = Subscription.find(payment_params[:subscription_id])
      rescue ActiveRecord::RecordNotFound
        render json: {
          errors: ['Subscription not found']
        }, status: :unprocessable_entity
      end

      # Validates the Razorpay payment signature using HMAC SHA256
      # Returns true if the signature is valid, otherwise false
      def valid_signature?
        payment_id = params[:razorpay_payment_id]
        order_id = params[:razorpay_order_id]
        signature = params[:razorpay_signature]

        generated_signature = OpenSSL::HMAC.hexdigest(
          'sha256',
          ENV['RAZORPAY_KEY_SECRET'],
          "#{order_id}|#{payment_id}"
        )

        generated_signature == signature
      end

      # Processes a successful payment:
      # - Finds the RazorpayPayment by the razorpay_order_id parameter
      # - Creates a new UserSubscription and updates the RazorpayPayment status to 'success'
      # - Renders JSON response with success message if both actions are successful
      # - Renders JSON response with error message if any action fails
      def process_successful_payment # rubocop:disable Metrics/MethodLength
        @payment = RazorpayPayment.find_by(razorpay_order_id: params[:razorpay_order_id])
        unless @payment
          return render json: {
            error: 'Razorpay Payment not found'
          }, status: :unprocessable_entity
        end
        @subscription = @payment.subscription

        @user_subscription = UserSubscription.new(
          name: @payment.name,
          email: @payment.email,
          subscription_id: @subscription.id,
          start_date: Time.current,
          end_date: calculate_end_date(@subscription.plan_type)
        )

        if @user_subscription.save && @payment.update(status: 'success')
          render json: {
            message: 'Payment successful and subscription created. You will get confirmation email shortly'
          }, status: :ok
        else
          render json: {
            error: 'Something went wrong'
          }, status: :unprocessable_entity
        end
      end

      # Calculates the end date based on the subscription plan type
      def calculate_end_date(plan_type)
        case plan_type
        when 'monthly'
          1.month.from_now
        when 'yearly'
          1.year.from_now
        else
          Time.current
        end
      end
    end
  end
end
