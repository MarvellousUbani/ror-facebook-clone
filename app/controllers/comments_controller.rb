class CommentsController < ApplicationController
	def create

   @comment = current_user.comments.build(comments_params)
   if @comment.save
   	redirect_to posts_path
   end
	end

	def destroy
  end

  private
    def comments_params
    	params.require(:comment).permit(:content,:post_id)
    end
end
