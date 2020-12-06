require 'csv'
class Booking < ApplicationRecord
  belongs_to :screening
  belongs_to :show_slot

  after_commit :update_screening
  validates :name, presence: true
  validates :email, presence: true
  validates :mobile_number, presence: true
  validates :booked_seats, presence: true

  def update_screening
    screen = Screening.find_by(id: screening_id)
    screen.reserved_seats ||= []
    screen.reserved_seats << booked_seats
    screen.update_attributes(reserved_seats: screen.reserved_seats.flatten.uniq)
  end

  def self.to_csv
    attributes = %w{id screening_id name email mobile_number booked_seats created_at updated_at payment_status amount}

    data = CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |booking|
        csv << attributes.map{ |attr| booking.send(attr) }
      end
    end
    data
  end

end
