# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show index]
  
  def index 
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = Post.where('author_id' => @user.id)
  end

  def index
    @users = User.all
  end
end
