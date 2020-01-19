class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id, null:false
      t.integer :friend_id, null:false
      t.integer :confirmed, default: 0

      t.timestamps
    end
  end
end
