# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactsController, type: :controller do # rubocop:disable Metrics/BlockLength
  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { { contact: { name: 'John Doe', email: 'john.doe@example.com', message: 'Hello' } } }

      it 'creates a new contact' do
        expect do
          post :create, params: valid_attributes, format: :turbo_stream
        end.to change(Contact, :count).by(1)
      end

      it 'renders the replace turbo stream for the message' do
        post :create, params: valid_attributes, format: :turbo_stream
        expect(response.body).to include('turbo-stream action="replace" target="contact-us-form"')
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { contact: { name: '', email: 'invalid_email', message: '' } } }

      it 'does not create a new contact' do
        expect do
          post :create, params: invalid_attributes, format: :turbo_stream
        end.to_not change(Contact, :count)
      end

      it 'renders the replace turbo stream for the form with errors' do
        post :create, params: invalid_attributes, format: :turbo_stream
        expect(response.body).to include('turbo-stream action="replace" target="contact-us-form"')
        expect(response.body).to include('form')
      end
    end
  end
end
