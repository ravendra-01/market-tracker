# frozen_string_literal: true

module Api
  module V1
    # The ContactsController handles the actions related to contact us form.
    # It includes the new and create action which is responsible for sending message to admin.
    class ContactsController < ApplicationController
      protect_from_forgery unless: -> { request.format.json? }

      def create
        @contact = Contact.new(contact_params)
        if @contact.save
          render json: {
            message: 'Thank you for contacting us. We will get back to you shortly.'
          }, status: :created
        else
          render json: {
            errors: @contact.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      private

      def contact_params
        params.require(:contact).permit(:name, :email, :message)
      end
    end
  end
end
