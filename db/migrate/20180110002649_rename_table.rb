class RenameTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :active_relationships, :mutual_relationships
  end
end
