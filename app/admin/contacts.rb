# frozen_string_literal: true

ActiveAdmin.register Contact do
  permit_params :name, :email, :message, :created_at, :updated_at
  filter :created_at
  filter :name
  filter :email
  filter :message

  actions :all, except: %i[new edit]
end
