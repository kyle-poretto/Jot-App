class RemoveJewelId < ActiveRecord::Migration[5.1]
  def change
    remove_column :jots, :jewel_id
  end
end
