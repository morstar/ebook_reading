class BooksController < ApplicationController
	before_action :find_book, only: [:show, :dashboard]
	before_action :find_post, only: [:show, :dashboard]

	def index
		@books = Book.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 9)
	end

	def show
	end

	def dashboard	
	end

	private

	def find_post
		@posts = Post.where(book_id: @book).order(:id).paginate(:page => params[:page], :per_page => 6)
	end

	def find_book
		if params[:id].nil?
			@book = current_book
		else
			@book = Book.find(params[:id])
		end
	end
end
