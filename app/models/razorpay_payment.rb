# frozen_string_literal: true

# This model represents a payment processed through Razorpay.
# It includes validations to ensure presence of essential attributes
# and uses the 'monetize' gem to handle the amount in cents.
class RazorpayPayment < ApplicationRecord
  belongs_to :subscription
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :razorpay_order_id, :status
  monetize :amount_cents, allow_nil: false
  enum :status, %w[pending success]
end
