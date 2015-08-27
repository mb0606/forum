class PostsController < ApplicationController

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
		@post = Post.find(params[:id])

	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "The Post was successfully saved"
			redirect_to @post
		else
			flash[:notice] = "The Post was not saved"
			render "new"
		end


	end

	def edit

	end

	def update

	end

	def destroy

	end

	private

	 def post_params
      params.require(:post).permit(:title, :content)
    end
end
