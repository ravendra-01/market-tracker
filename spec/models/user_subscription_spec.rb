# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSubscription, type: :model do
  it { should belong_to(:subscription) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_presence_of(:email) }
  it { should allow_value('email@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }

  context 'custom validation' do
    it 'should validate start_date is before end_date' do
      user_subscription = build(:user_subscription, start_date: Date.today + 1.month, end_date: Date.today)
      expect(user_subscription).to_not be_valid
      expect(user_subscription.errors[:start_date]).to include('must be before end date')
    end
  end
end
