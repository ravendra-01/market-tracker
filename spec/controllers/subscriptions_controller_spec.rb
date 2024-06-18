# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  describe 'GET #index' do
    let!(:subscription) { create(:subscription) }

    it 'loads all subscriptions with their features for Turbo Stream format' do
      get :index, format: :turbo_stream
      expect(assigns(:subscriptions)).to eq([subscription])
      expect(response.content_type).to include('text/vnd.turbo-stream.html')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let!(:subscription) { create(:subscription) }

    it 'loads the requested subscription' do
      get :show, params: { id: subscription.id }, format: :turbo_stream
      expect(assigns(:subscription)).to eq(subscription)
      expect(response.content_type).to include('text/vnd.turbo-stream.html')
      expect(response).to render_template(:show)
    end
  end
end
