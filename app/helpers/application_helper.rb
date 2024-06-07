# frozen_string_literal: true

module ApplicationHelper
  def feature_class(feature_id, subs_feature_ids)
    class_names = 'mb-2'
    class_names += ' line-through' unless subs_feature_ids.include?(feature_id)
    class_names
  end
end
