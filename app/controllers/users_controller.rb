# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show index]

  before_action :user_friends, only: %i[show index]

  def index
    @pending_friends = Friendship.pending_requests(current_user.id)
    @not_friends = User.where.not(
      id: (@confirmed_friends.map(&:friend_id) + @pending_friends.map(&:friend_id))
    )
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
  end

  private

  def user_friends
    @confirmed_friends = Friendship.confirmed_requests(current_user.id)
    @accept_friends = Friendship.accept_requests(current_user.id)
    
  end
end
