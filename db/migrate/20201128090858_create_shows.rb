class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.integer :movie_id
      t.datetime :show_date
      t.string :show_slot

      t.timestamps
    end
  end
end
