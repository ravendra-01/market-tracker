# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'assigns a new Contact to @contact' do
      get :index
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
