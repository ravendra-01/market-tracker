# frozen_string_literal: true

ActiveAdmin.register UserSubscription do
  permit_params :name, :email, :start_date, :end_date, :subscription_id, :created_at, :updated_at

  actions :all, except: %i[new edit]
end
