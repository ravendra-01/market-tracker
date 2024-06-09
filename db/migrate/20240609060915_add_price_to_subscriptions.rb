# frozen_string_literal: true

# This migration modifies the subscriptions table to use the Money gem for handling monetary values.
# Specifically, it removes the existing price column and adds a new price column with support for currency.
# This change facilitates more precise and flexible handling of monetary amounts, leveraging the Money gem's features.
class AddPriceToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    remove_column :subscriptions, :price, :decimal
    add_monetize :subscriptions, :price
  end
end
