# frozen_string_literal: true

# The ContactsController handles the actions related to contact us form.
# It includes the new and create action which is responsible for sending message to admin.
class UserSubscriptionsController < ApplicationController
  def new
    @user_subscription = UserSubscription.new
  end

  def create
    @user_subscription = UserSubscription.new(user_subscription_params)
    @user_subscription.start_date = Time.current
    @user_subscription.end_date = calculate_end_date(@user_subscription.subscription.plan_type)
    if @user_subscription.save
      redirect_to root_path, notice: 'Subscription created successfully.'
    else
      render turbo_stream: turbo_stream.replace('user-subscription', partial: 'form', locals: { user_subscription: @user_subscription })
    end
  end

  private

  def calculate_end_date(plan_type)
    case plan_type
    when 'monthly'
      1.month.from_now
    when 'yearly'
      1.year.from_now
    else
      Time.current
    end
  end

  def user_subscription_params
    params.require(:user_subscription).permit(:name, :email, :subscription_id)
  end
end
