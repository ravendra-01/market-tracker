# frozen_string_literal: true

# This migration creates user subscriptions table.
# The user subscriptions table stores subscription details of users.
class CreateUserSubscription < ActiveRecord::Migration[7.1]
  def change
    create_table :user_subscriptions do |t|
      t.references :subscription
      t.string :name
      t.string :email
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
