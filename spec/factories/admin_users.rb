# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    email { 'admin@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
