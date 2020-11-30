class Screening < ApplicationRecord
  belongs_to :show
  has_many :bookings

  # scope :valid, -> {Screening.joins(:show).where('show_date >= ?', Time.now)}
end
