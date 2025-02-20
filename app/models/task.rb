class Task < ApplicationRecord

  # paginates_per 20

  include Filterable
  include Sortable

  scope :filter_by_status, -> (status) { where(status: status)}
  scope :filter_by_search_term, -> (title) { where("title LIKE ?", "%#{title}%")}

  validates :title, presence: :true
  enum :status, %i[ pending in-progress completed ]

  belongs_to :user

  def self.filter_abc(status)
    where(status: status)
  end

  def self.filter_xyz(status)
    where(status: status)
  end

end
