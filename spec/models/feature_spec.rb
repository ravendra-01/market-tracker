# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feature, type: :model do
  it { should have_many(:subscription_features) }
  it { should have_many(:subscriptions).through(:subscription_features) }
  it { should validate_presence_of(:description) }
end
