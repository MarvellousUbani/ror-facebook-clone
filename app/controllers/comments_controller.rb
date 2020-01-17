# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)
    redirect_back(fallback_location: root_path) if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :post_id)
  end
end
