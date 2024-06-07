# frozen_string_literal: true

# The Feature model represents individual features associated with a subscription.
class Feature < ApplicationRecord
  has_many :subscription_features
  has_many :subscriptions, through: :subscription_features
  validates_presence_of :description

  def self.ransackable_attributes(_auth_object = nil)
    ['description']
  end
end
