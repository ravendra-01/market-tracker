# frozen_string_literal: true

ActiveAdmin.register Feature do
  permit_params :description, :created_at, :updated_at
  filter :description
end
