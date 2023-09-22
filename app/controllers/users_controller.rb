class UsersController < ApplicationController
  
  before_action :authenticate_use!
  before_ation :ensure_current_user, {only: [:edit,:update,:destroy]}
  
  def new
    @book = book.new
  end
  
  
  def show
    @book = book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
  end
    
  def new
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "users/sign_up"
    end
  end
  
  
  def index
    @users =User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  def update
    flash[:notice] = "You have updated user successfully."
    redirect_to "/users/#{current_user.id}"
  else
    flash[:notice] = "errors prohibited this obj from being saved:"
end
