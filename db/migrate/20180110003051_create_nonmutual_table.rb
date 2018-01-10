class CreateNonmutualTable < ActiveRecord::Migration[5.1]
  def change
    create_table :nonmutual_tables do |t|
      t.integer :followed_id
      t.integer :follower_id
    end
  end
end
