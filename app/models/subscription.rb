# frozen_string_literal: true

# The Subscription model represents a subscription plan.
# Each subscription can have multiple features associated with it.
# Validations ensure that the name, price, start date, and end date are always present.
class Subscription < ApplicationRecord
  has_many :subscription_features
  has_many :features, through: :subscription_features
  validates_presence_of :name, :price, :plan_type
  enum :plan_type, %i[monthly yearly]

  def self.ransackable_attributes(_auth_object = nil)
    %w[name plan_type]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[features subscription_features]
  end
end
