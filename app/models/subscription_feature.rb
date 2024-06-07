# frozen_string_literal: true

# The SubscriptionFeature model represents relationship between subscription and its features.
class SubscriptionFeature < ApplicationRecord
  belongs_to :subscription
  belongs_to :feature

  def self.ransackable_associations(_auth_object = nil)
    %w[feature subscription]
  end

  def self.ransackable_attributes(_auth_object = nil)
    ['created_at']
  end
end
