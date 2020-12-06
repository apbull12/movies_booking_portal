class AddSlotToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :show_slot_id, :integer
  end
end
