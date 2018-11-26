class BooksController < ApplicationController
	before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

    def index
        @books = Book.all
        @new_book = Book.new
    end


    def create
        @new_book = Book.new(book_params)
        @new_book.user_id = current_user.id
        if @new_book.save
            redirect_to book_path(@new_book.id), notice: "Book was successfully created."
        else
            @books = Book.all
            render "index"
        end
    end

    def show
        @new_book = Book.new
    	@book = Book.find(params[:id])
    end

    def edit
  	    @book = Book.find(params[:id])
    end

    def update
	    @book = Book.find(params[:id])
	    if @book.update(book_params)
	        redirect_to book_path(@book.id), notice: "Book was successfully updated."
        else
            render "edit"
        end
    end

    def destroy
    	@book = Book.find(params[:id])
     	@book.destroy
    	redirect_to books_path, notice: "Book was successfully destroyed."
    end

    private
        def book_params
            params.require(:book).permit(:title, :opinion)
        end

    def correct_user
        @book = Book.find(params[:id])
        if current_user != @book.user
          redirect_to books_path
        end
    end
end
