# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = Like.new(likes_params)
    redirect_back(fallback_location: root_path) if @like.save
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def likes_params
    params.permit(:user_id, :post_id)
  end
end
