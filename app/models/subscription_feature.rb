# frozen_string_literal: true

# The Subscription model represents a subscription plan.
# Each subscription can have multiple features associated with it.
# Validations ensure that the name, price, start date, and end date are always present.
class SubscriptionFeature < ApplicationRecord
  belongs_to :subscription
  belongs_to :feature
end
