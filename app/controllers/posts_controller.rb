class PostsController < ApplicationController
	before_action :authenticate_book!, except: [:show]
	before_action :require_permission
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
 
	def show
		@posts = Post.where(book_id: @book).order(:id).paginate(:page => params[:page], :per_page => 1)
	end

	def edit
		
	end

	def update
		if @post.update post_params
			redirect_to book_post_path(@book, @post), notice: "post was succesfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

private

	def post_params
		params.require(:post).permit(:description, :thumbnail, :id, :mp3)
	end

	def find_book
		@book = Book.find(params[:book_id])
	end

	def find_post
		@post = Post.find(params[:id])
	end

	def require_permission
		@book =Book.find(params[:book_id])
		if current_book != @book
			redirect_to root_path, notice: "Sorry, you're not allow to view that post."
		end
	end
end
