class CreateShowSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :show_slots do |t|
      t.string :timings

      t.timestamps
    end
  end
end
