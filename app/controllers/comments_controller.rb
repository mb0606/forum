class CommentsController < ApplicationController

	before_action :find_post
	before_action :find_comment , only: [:edit, :update, :destroy]

	def create
		@comment = @post.comments.create(params[:comment].permit(:body))
		@comment.user_id = current_user.id
		

		if @comment.save
			redirect_to post_path(@post)
		else
			redirect_to post_path(@post)
		end

	end

	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	def edit
	end

	def update 
		if @comment.update(params[:comment].permit(:body))
			redirect_to @post
		else
			render 'edit'
		end
	end




	private

	def find_post
		@post= Post.find(params[:post_id])
	end

	def find_comment
		@comment = @post.comments.find(params[:id])
	end


end
