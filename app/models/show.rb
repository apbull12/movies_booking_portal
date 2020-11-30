class Show < ApplicationRecord
  belongs_to :movie
  has_many :screenings

  validates :show_date, uniqueness: { scope: :movie_id }
  validates :show_slot, uniqueness: { scope: :show_date}

  scope :valid, -> { where('show_date >= ?', Date.today)}
end
