# frozen_string_literal: true

ActiveAdmin.register SubscriptionFeature do # rubocop:disable Metrics/BlockLength
  permit_params :feature_id, :subscription_id, :created_at, :updated_at
  filter :created_at

  index do
    selectable_column
    id_column
    column :subscription do |resource|
      resource.subscription&.name
    end
    column :feature do |resource|
      resource.feature&.description
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :subscription do |resource|
        resource.subscription&.name
      end
      row :feature do |resource|
        resource.feature&.description
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :subscription_id, as: :select, include_blank: false, prompt: 'Select subscription', collection: Subscription.all.map { |subscription| [subscription.name, subscription.id] }
      f.input :feature_id, as: :select, include_blank: false, prompt: 'Select feature', collection: Feature.all.map { |feature| [feature.description, feature.id] }
    end
    f.actions
  end
end
