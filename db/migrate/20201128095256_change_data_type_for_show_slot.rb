class ChangeDataTypeForShowSlot < ActiveRecord::Migration[6.0]
  def change
    change_column :shows, :show_slot, :text, array: true, default: [],  using: "(string_to_array(show_slot, ','))"
  end
end
