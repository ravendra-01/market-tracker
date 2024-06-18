# frozen_string_literal: true

require 'rails_helper'
require 'money-rails/test_helpers'

RSpec.describe RazorpayPayment, type: :model do
  it { should belong_to(:subscription) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_presence_of(:email) }
  it { should allow_value('email@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }
  it { should validate_presence_of(:razorpay_order_id) }
  it { should validate_presence_of(:status) }
  it { should monetize(:amount_cents) }
  it { should define_enum_for(:status).with_values(%w[pending success]) }
end
