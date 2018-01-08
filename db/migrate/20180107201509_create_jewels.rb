class CreateJewels < ActiveRecord::Migration[5.1]
  def change
    create_table :jewels do |t|
      t.string :jot_id
      t.string :body
      t.timestamps
    end
  end
end
