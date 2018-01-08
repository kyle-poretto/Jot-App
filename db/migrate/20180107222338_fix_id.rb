class FixId < ActiveRecord::Migration[5.1]
  def change
    change_column :jots, :user_id, :integer
    change_column :jots, :jewel_id, :integer
  end
end
