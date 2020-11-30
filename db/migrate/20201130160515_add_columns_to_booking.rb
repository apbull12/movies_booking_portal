class AddColumnsToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :payment_status, :boolean, default: false
    add_column :bookings, :amount, :integer, default: 0
  end
end
