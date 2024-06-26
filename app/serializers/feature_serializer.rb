# frozen_string_literal: true

# FeatureSerializer is responsible for serializing Feature objects.
# It defines the JSON structure for the Feature model, including only the id and description attributes.
# This serializer is used to control how Feature objects are represented in API responses.
class FeatureSerializer < ActiveModel::Serializer
  attributes :id, :description
end
