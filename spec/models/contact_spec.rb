# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_presence_of(:email) }
  it { should allow_value('email@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }
  it { should validate_presence_of(:message) }
  it { should validate_length_of(:message).is_at_most(500) }
end
