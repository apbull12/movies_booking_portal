class Movie < ApplicationRecord
  has_many :shows

  scope :active, -> { where(status: true) }
end
