module Sortable
  extend ActiveSupport::Concern

  ALLOWED_DIRECTION = %w[desc asc].freeze

  included do
    scope :apply_sorting, -> (sorting_params, allowed_columns) {
      if sorting_params[:sort].present? && sorting_params[:direction].present? &&
         ALLOWED_DIRECTION.include?(sorting_params[:direction]) && allowed_columns.include?(sorting_params[:sort])
         order_clause = Arel.sql("#{sorting_params[:sort]} #{sorting_params[:direction]}")
         order(order_clause)
      else
        all
      end
    }
  end

end