class UsersController < ApplicationController
  def new
    @book = book.new
  end
  
  
  def edit
    @user = User.find(params[:id])
    
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user.id)
  end
end
end
