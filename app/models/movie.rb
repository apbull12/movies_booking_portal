class Movie < ApplicationRecord
  has_many :shows
  has_many :screenings, through: :shows
  validates :name, presence: true
  validates :status, presence: true
  validates :category, presence: true

  scope :active, -> { where(status: true) }
end
