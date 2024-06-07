# frozen_string_literal: true

ActiveAdmin.register Subscription do # rubocop:disable Metrics/BlockLength
  permit_params :name, :price, :plan_type, :created_at, :updated_at

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :plan_type
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :plan_type, as: :select, collection: Subscription.plan_types.keys

  show do
    attributes_table do
      row :name
      row :price
      row :plan_type
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :plan_type, as: :select, include_blank: false, prompt: 'Select plan type', collection: Subscription.plan_types.keys.map { |key| [key.titleize, key] }
    end
    f.actions
  end
end
