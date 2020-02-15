# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:friend_id])
    @friendship = Friendship.new(friendships_params)
    @friendship.save
    @friendship.users << @user
    @friendship.users << current_user
    redirect_back(fallback_location: root_path)
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.approved!
    redirect_back(fallback_location: root_path)
  end

  private

  def friendships_params
    params.permit(:user_id, :friend_id)
  end
end
