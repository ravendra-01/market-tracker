# frozen_string_literal: true

# This migration creates subscriptions table.
# The subscriptions table will store the main subscription details including name, price, start date, and end date.
# The features table will store various features associated with each subscription.
# Each feature will have a reference to a subscription and a description of the feature.
class CreateSubscription < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.integer :plan_type

      t.timestamps
    end
  end
end
