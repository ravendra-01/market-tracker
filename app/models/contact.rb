# frozen_string_literal: true

# The Contact model represents a message submitted through the "Contact Us" form on the website.
# It includes validations to ensure that the form is filled out correctly.
# Attributes:
# - name: the name of the person submitting the message, must be present and no longer than 50 characters.
# - email: the email address of the person submitting the message, must be present and in a valid email format.
# - message: the content of the message being submitted, must be present and no longer than 500 characters.
class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true, length: { maximum: 500 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at email message name]
  end
end
