# frozen_string_literal: true

# HomeController is responsible for handling requests to the home page of the application.
# This controller currently has a single action, `index`, which renders the home page view.
class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end
end
