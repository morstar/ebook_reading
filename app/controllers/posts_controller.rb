class PostsController < ApplicationController
	before_action :find_book
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def new
		@post = @book.posts.new
	end

	def create
		@post = @book.posts.new(post_params)
		if @post.save
			redirect_to book_post_path(@book,@post)
		else
			render 'new'
		end
	end

	def show
		@pages = Page.where(book_id: @book)
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
