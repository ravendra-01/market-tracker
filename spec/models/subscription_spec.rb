# frozen_string_literal: true

require 'rails_helper'
require 'money-rails/test_helpers'

RSpec.describe Subscription, type: :model do
  it { should have_many(:subscription_features) }
  it { should have_many(:features).through(:subscription_features) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:plan_type) }
  it { should define_enum_for(:plan_type).with_values(%i[monthly yearly]) }
  it { should monetize(:price_cents).as(:price) }
end
