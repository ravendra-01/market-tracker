# frozen_string_literal: true

module Api
  module V1
    # The SubscriptionsController handles the actions related to subscription plans.
    # It includes the `index` action which is responsible for retrieving and displaying all subscription plans.
    class SubscriptionsController < ApplicationController
      protect_from_forgery unless: -> { request.format.json? }

      def index
        @subscriptions = Subscription.includes(:features).all
        render json: @subscriptions, status: :ok
      end
    end
  end
end
