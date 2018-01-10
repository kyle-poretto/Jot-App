class RenameTableNonmutual < ActiveRecord::Migration[5.1]
  def change
    rename_table :nonmutual_tables, :nonmutual_relationships
  end
end
