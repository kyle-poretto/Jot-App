class AddId < ActiveRecord::Migration[5.1]
  def change
    add_column :jots, :jewel_id, :integer
  end
end
