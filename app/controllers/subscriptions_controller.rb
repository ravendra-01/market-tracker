# frozen_string_literal: true

# The SubscriptionsController handles the actions related to subscription plans.
# It includes the `index` action which is responsible for retrieving and displaying all subscription plans.
class SubscriptionsController < ApplicationController
  # The subscription plans are preloaded with their associated features to optimize database queries.
  # The index action responds to both HTML and Turbo Stream formats.
  # - For HTML format, it renders the default view.
  # - For Turbo Stream format, it replaces the content of an element with the ID main-content with the rendered partial.
  def index
    @subscriptions = Subscription.includes(:features).all
  end

  def show
    @subscription = Subscription.find(params[:id])
  end
end
