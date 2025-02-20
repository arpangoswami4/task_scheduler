module Filterable
  extend ActiveSupport::Concern

  included do
    scope :apply_filter, -> (filter_params) {
      results = all
      filter_params.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end
      results
    }
  end
end