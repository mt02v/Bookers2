class BooksController < ApplicationController
  before_action :authenticate_user!
  #before_action :ensure_current_user, only: [:edit, :update, :destroy]

   def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "You have created book successfully."
            redirect_to book_path(@book)
        else
           @books = Book.all
           flash.now[:alert] = "errors prohibited this obj from being saved:"
            render :index
        end
   end

   def index
     @books = Book.all
     @book = Book.new
     @user = current_user
   end

   def show
     @book = Book.find(params[:id])
     @user = @book.user
     @book_new = Book.new
   end

   def edit
     @book = Book.find(params[:id])
     if @book.user_id != current_user.id
      flash[:alert] = "You don't have permission to edit this book"
      redirect_to books_path
     end
   end

   def update
     @book = Book.find(params[:id])
     if @book.user_id != current_user.id
       redirect_to book_path(@book)
       return
     end
       if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to  book_path(@book.id)
       else
      @books = Book.all
      flash.now[:alert] = "Failed to update the book."
      render :edit
       end
   end

    def destroy
      @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      @book.destroy
      flash[:notice] = "Book has been deleted successfully."
    else
      flash[:alert] = "You don't have permission to delete this book."
    end
      redirect_to books_path
    end

        private

    def book_params
      params.require(:book).permit(:title, :body)
    end

end