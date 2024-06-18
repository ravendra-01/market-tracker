# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it 'is valid with valid attributes' do
    admin_user = build(:admin_user)
    expect(admin_user).to be_valid
  end

  it 'is not valid without an email' do
    admin_user = build(:admin_user, email: nil)
    expect(admin_user).to_not be_valid
  end

  it 'is not valid without a password' do
    admin_user = build(:admin_user, password: nil)
    expect(admin_user).to_not be_valid
  end
end
