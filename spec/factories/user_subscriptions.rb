# frozen_string_literal: true

FactoryBot.define do
  factory :user_subscription do
    association :subscription
    name { 'John Doe' }
    email { 'john.doe@example.com' }
    start_date { Date.today }
    end_date { Date.today + 1.month }
  end
end
