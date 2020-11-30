class ChangeDataTypeForReservedSeats < ActiveRecord::Migration[6.0]
  def change
    change_column :screenings, :reserved_seats, :jsonb, default: []
  end
end
