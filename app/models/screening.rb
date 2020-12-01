class Screening < ApplicationRecord
  belongs_to :show
  has_many :bookings

  validates :rows, presence: true
  validates :total_seats, presence: true

  # scope :valid, -> {Screening.joins(:show).where('show_date >= ?', Time.now)}
end
