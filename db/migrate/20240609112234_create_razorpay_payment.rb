# frozen_string_literal: true

# This migration creates the razorpay_payments table to store information related to payments made via Razorpay.
# The table includes columns for order ID, payment amount, status, payment time, method, description, and additional notes.
# The `amount` column uses the `monetize` method to store money-related values with precision and scale.
class CreateRazorpayPayment < ActiveRecord::Migration[7.1]
  def change
    create_table :razorpay_payments do |t|
      t.string :razorpay_order_id
      t.monetize :amount
      t.integer :status
      t.datetime :paid_at
      t.string :method
      t.string :description
      t.json :notes
      t.string :name
      t.string :email
      t.references :subscription

      t.timestamps
    end
  end
end
