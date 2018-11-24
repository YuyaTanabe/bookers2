class BooksController < ApplicationController
	# before_action :authenticate_user!

    def index
        @books = Book.all
        @new_book = Book.new
    end

    def new
    	@book = Book.new
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to book_path(@book.id), notice: "Book was successfully created."
        else
            @new_book = Book.new
            @books = Book.all
            render :index
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
	    @book.update(book_params)
	    redirect_to book_path(@book.id), notice: "Book was successfully updated."
    end


    def destroy
    	@book = Book.find(params[:id])
        profile_image_id = @book.user_id
     	@book.destroy
    	redirect_to books_path, notice: "Book was successfully destroyed."
        
    end

    private
        def book_params
            params.require(:book).permit(:title, :opinion)
        end
end
