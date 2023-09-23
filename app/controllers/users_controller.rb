class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.order('updated_at DESC')
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @book = Book.new
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
    flash[:notice] = "Your user info has been successfully updated."
    redirect_to user_path(@user.id)
    else
     render :edit
    end
  end


    private
    
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
    
    def is_matching_login_user
      user_id = params[:id].to_i
      unless user_id == current_user.id
        redirect_to user_path(current_user)
      end
    end
end
