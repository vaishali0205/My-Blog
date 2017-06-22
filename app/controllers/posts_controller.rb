class PostsController < ApplicationController
	def index
		@posts=Post.all
	end

	def show
		@post=Post.find_by(id: params[:id])
	end

	def new
		@post=Post.new
		@categories=Category.all
	end

	def create
		@post=Post.new(post_params)
		if @post.save
			redirect_to posts_path,:notice =>"Your post has been saved"
		else
			render "new"
		end
	end

	def post_params
		params.require(:post).permit(:title,:body,:category_id)
	end

	def edit
		@post=Post.find_by_id(params[:id])
	end

	def update
		@post=Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to post_path,:notice=>"Your post has been updated"
		else
			render "edit"
		end
	end

	def destroy
		@post=Post.find_by_id(params[:id])
		@post.destroy
		redirect_to posts_path
	end

end
