# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    name { 'Basic Plan' }
    plan_type { :monthly }
    price_cents { 1000 }
  end
end
