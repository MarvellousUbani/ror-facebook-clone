class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :index]
    before_action :post_owner, only: [:destroy]


	def new
	  @post = Post.new
	  @posts = Post.all
	end

    def create
        @post = current_user.posts.build(posts_params)
        @post.author = current_user
        if @post.save  
            redirect_to posts_path
        else
            render 'posts/new'
        end
    end


    def index
       @posts = Post.all
    end

    def destroy
    	@post = Post.find(params[:id])
    	@post.destroy
    	redirect_to posts_path
    end

	private

        def posts_params
        	params.require(:post).permit(:content)
        end


        def post_owner
          @post = Post.find(params[:id])
          unless current_user == @post.author
            redirect_to posts_path
          end
        end
end
