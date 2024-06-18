# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubscriptionFeature, type: :model do
  it { should belong_to(:subscription) }
  it { should belong_to(:feature) }
  it { should validate_uniqueness_of(:subscription_id).scoped_to(:feature_id).with_message('Subscription and feature combination already exists') }
end
