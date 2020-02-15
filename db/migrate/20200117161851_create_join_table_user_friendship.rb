class CreateJoinTableUserFriendship < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :friendships do |t|
      # t.index [:user_id, :friendship_id]
      # t.index [:friendship_id, :user_id]
    end
  end
end
