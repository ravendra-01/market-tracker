# frozen_string_literal: true

# The UserSubscription model represents a users subscription plan.
# Each UserSubscription belongs to one subscription.
# Validations ensure that the name, email, start date, and end date are always present.
class UserSubscription < ApplicationRecord
  belongs_to :subscription
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_before_end_date

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at email end_date id id_value name start_date subscription_id updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['subscription']
  end

  private

  def start_date_before_end_date
    errors.add(:start_date, 'must be before end date') if start_date >= end_date
  end
end
