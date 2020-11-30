class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :screening_id
      t.string :name
      t.string :email
      t.string :mobile_number
      t.integer :booked_seats, array: true, default: []

      t.timestamps
    end
  end
end
