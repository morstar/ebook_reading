class PostsController < ApplicationController
	before_action :find_book
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def new
		@post = @book.posts.new
	end

	def create
		@post = @book.posts.new(post_params)
		if @post.save
			redirect_to root_path
		else
			render 'new'
		end
	end

private

	def post_params
		params.require(:post).permit(:title, :description)
	end

	def find_book
		@book = Book.find(params[:book_id])
	end

	def find_post
		@post = Post.find(params[:id])
	end

end
