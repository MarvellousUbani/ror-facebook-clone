class LikesController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@like = Like.new(likes_params)
		if @like.save
			redirect_back(fallback_location: root_path)
		end
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
