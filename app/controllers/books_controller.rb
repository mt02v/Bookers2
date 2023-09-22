class BooksController < ApplicationController
  before_ation :authenticate_user!
  before_action :ensure_current_user, {only: [:edit,:update, :destroy]}
  
   def create
     @user =current_user
       @book = Book.new(book_params)
    @book.user_id = (current_user.id)
        if @book.save
    flash[:notice] = "You have creatad book successfully."
            redirect_to book_path(@book.id)
            
  　else
  　 @books = Book.all
  　 flash[:notice] = "errors prohibited this obj from being saved:"
  　 render "index"
  
   def index
     @user = current_user
     @books = book.all
     @book = Book.new
   end
   
   def show
     @user = current_user
     @book = Book.find(params[:id])
     @book = Book.new
   end

end