# frozen_string_literal: true

# The ContactsController handles the actions related to contact us form.
# It includes the new and create action which is responsible for sending message to admin.
class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render_turbo_stream('replace', 'contact-us-form', 'message')
    else
      render_turbo_stream('replace', 'contact-us-form', 'form', { contact: @contact })
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
