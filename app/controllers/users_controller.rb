# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = Post.where('author_id' => @user.id)
  end
end
