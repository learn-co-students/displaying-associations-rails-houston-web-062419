class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def create
		post = Post.create(params[:post])
		redirect_to post_path(post)
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
		# byebug
	end

	def update
		post = Post.find(params[:id])
		post.update(posts_params(:title, :description))
		# byebug
		redirect_to post_path(post)
	end

	private

	def posts_params(*args)
	  params.require(:post).permit(*args)
	end
end
