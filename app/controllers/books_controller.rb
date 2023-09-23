class BooksController < ApplicationController
  before_ation :authenticate_user!
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
  
   def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
        if @book.save
    flash[:notice] = "Your book has been successfully created!"
            redirect_to book_path(@book)
            
  　else
  　 @books = Book.all
  　 render :index
  　 end
   end
     
   def index
     Unless user_signed_in?
      redirect_to user_session_path
   
     @books = Book.all
     @book = Book.new
   end
   
   def show
     unless user_signed_in?
      redirect_to user_session_path
     end
     @user = @book.user
     @book = Book.find(params[:id])
     @book = Book.new
   end
   
   def edit
     @book = Book.find(params[:id])
     unless @book.user_id == current_user.id
      redirect_to books_path
     end
   end
   
   def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
     flash[:notice] = "Your book has been successfully updated!."
     redirect_to book_path(@book)
     
     else
      render "edit"
     end
   end
    
    def destroy
      @book = Book.find(params[:id])
    if @book.user == current_user
      @book.destroy
      flash[:notice] = "The book has been successfully deleted."
      redirect_to books_path
    else
      nil
    end
    end
        private
  
    def book_params
      params.require(:book).permit(:title, :body)
    end
    
end