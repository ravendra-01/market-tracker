# frozen_string_literal: true

# This migration creates two tables: features and subscription_features.
# The features table stores feature descriptions.
# The subscription_features table is a relationship table that establishes a many-to-many relationship
# between subscriptions and features by storing references to both.
class CreateFeature < ActiveRecord::Migration[7.1]
  def change
    create_table :features do |t|
      t.text :description

      t.timestamps
    end

    create_table :subscription_features do |t|
      t.references :subscription
      t.references :feature

      t.timestamps
    end
  end
end
