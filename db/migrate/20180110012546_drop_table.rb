class DropTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :mutual_relationships
    drop_table :nonmutual_relationships
  end
end
