# frozen_string_literal: true

# SubscriptionSerializer is responsible for serializing Subscription objects.
# It defines the JSON structure for the Subscription model.
class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :plan_type, :price, :yearly_price, :price_currency, :weekly_price, :features

  def yearly_price
    object.price&.to_s
  end

  def weekly_price
    (object.price / 52).round(2).to_s
  end

  def features
    object.features.map { |feature| FeatureSerializer.new(feature).attributes }
  end
end
