# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :find_friendship, only: %i[update destroy]

  def create
    @friendship = Friendship.new(friendships_params)
    @friendship.save
    redirect_back(fallback_location: root_path)
  end

  def update
    @friendship.update(confirmed: true)
    @confirmed_friendship = Friendship.new(user_id: @friendship.friend_id,
                                           friend_id: @friendship.user_id, confirmed: 'true')
    @confirmed_friendship.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @friendship.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_friendship
    @friendship = Friendship.find(params[:id])
  end

  def friendships_params
    params.permit(:user_id, :friend_id)
  end
end
