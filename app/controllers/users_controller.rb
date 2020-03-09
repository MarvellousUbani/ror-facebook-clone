# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show index]

  def index
    @pending_friends = Friendship.pending_requests(current_user.id)
    @confirmed_friends = Friendship.confirmed_requests(current_user.id)
    @accept_friends = Friendship.accept_requests(current_user.id)
    @not_friends = User.where.not(
      id: (@confirmed_friends.map(&:id) + @pending_friends.map(&:id))
    ).reject { |user| user == current_user }
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
  end
end
