# frozen_string_literal: true

class ApplicationController < ActionController::Base

  include DeviseWhitelist


  def current_user_friendship_status(friend_id, user_id, confirmed)
    Friendship.exists?(friend_id: friend_id, user_id: user_id, confirmed: confirmed)
  end

  def current_user_friendship_find(friend_id, user_id, confirmed)
    Friendship.find_by(friend_id: friend_id, user_id: user_id, confirmed: confirmed)
  end

end
