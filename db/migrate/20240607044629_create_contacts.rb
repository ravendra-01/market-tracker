# frozen_string_literal: true

# This migration creates contacts table.
# The contacts table stores messages from users.
class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
