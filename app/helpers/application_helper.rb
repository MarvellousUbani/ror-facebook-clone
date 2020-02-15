# frozen_string_literal: true

module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      gravatar_image_url(user.email)
    end
  end

  def current_user_friendship_status(friend_id, user_id, confirmed)
    Friendship.exists?(friend_id: friend_id, user_id: user_id, confirmed: confirmed)
  end

  def current_user_friendship_find(friend_id, user_id, confirmed)
    Friendship.find_by(friend_id: friend_id, user_id: user_id, confirmed: confirmed)
  end
end
