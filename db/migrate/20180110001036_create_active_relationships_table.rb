class CreateActiveRelationshipsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :active_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
    end
  end
end
