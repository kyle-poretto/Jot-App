class FixJewelId < ActiveRecord::Migration[5.1]
  def change
    change_column :jewels, :jot_id, :integer
  end
end
