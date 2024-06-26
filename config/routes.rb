# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
  # get 'subscriptions', to: 'subscriptions#index'
  post 'contacts', to: 'contacts#create'
  post 'payments/create_order', to: 'razorpay_payments#create_order'
  post 'payments/verify_payment', to: 'razorpay_payments#verify_payment'
  get 'payments/new', to: 'razorpay_payments#new'
  resources :user_subscriptions, only: %i[new create]
  resources :subscriptions, only: %i[index show]

  get 'api/v1/subscriptions', to: 'api/v1/subscriptions#index'
  post 'api/v1/razorpay_payments/create_order', to: 'api/v1/razorpay_payments#create_order'
  post 'api/v1/razorpay_payments/verify_payment', to: 'api/v1/razorpay_payments#verify_payment'
  post 'api/v1/contacts', to: 'api/v1/contacts#create'
end
