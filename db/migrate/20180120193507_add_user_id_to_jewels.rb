class AddUserIdToJewels < ActiveRecord::Migration[5.1]
  def change
    add_column :jewels, :user_id, :integer
  end
end
