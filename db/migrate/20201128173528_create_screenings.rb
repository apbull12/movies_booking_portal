class CreateScreenings < ActiveRecord::Migration[6.0]
  def change
    create_table :screenings do |t|
      t.integer :show_id
      t.integer :rows
      t.integer :total_seats
      t.jsonb :reserved_seats

      t.timestamps
    end
  end
end
