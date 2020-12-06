class Screening < ApplicationRecord
  belongs_to :show
  has_many :bookings

  validates :show_id, presence: true, uniqueness: true
  validates :rows, presence: true
  validates :total_seats, presence: true

  # scope :valid, -> {Screening.joins(:show).where('show_date >= ?', Time.now)}
end
