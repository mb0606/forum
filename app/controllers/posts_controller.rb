class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show


	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
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
		if @post.update(post_params)
			flash[:notice] = "Post was updated"
			redirect_to @post
		else
			flash[:notice] = "Post was not updated"
			render 'edit'
		end

	end

	def destroy
		if @post.destroy
			flash[:notice] = "Post was Deleted"
			redirect_to root_path
		else
			flash[:notice] ="Post was not deleted"
			redirect_to @post
		end

	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	 def post_params
      params.require(:post).permit(:title, :content)
    end
end
