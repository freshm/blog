class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :friend_id
      t.integer :other_friend_id

      t.timestamps
    end
    
    add_index :friendships, :friend_id
    add_index :friendships, :other_friend_id
    add_index :friendships, [:friend_id, :other_friend_id], unique: true
  end
end
