# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'John Doe' }
    email { 'john.doe@example.com' }
    message { 'This is a test message.' }
  end
end
