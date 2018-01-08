class CreateJotTable < ActiveRecord::Migration[5.1]
  def change
    create_table :jots do |t|
      t.string :title
      t.string :body
      t.string :user_id
      t.string :jewel_id
      t.timestamps
    end
  end
end
