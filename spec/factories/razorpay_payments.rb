# frozen_string_literal: true

FactoryBot.define do
  factory :razorpay_payment do
    association :subscription
    name { 'John Doe' }
    email { 'john.doe@example.com' }
    razorpay_order_id { 'order_1' }
    status { 'pending' }
    amount_cents { 1000 }
  end
end
