class UsersController < ApplicationController
  before_ation :is_matching_login_user, only: [:edit, :update]
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.oeder('updated_at DESC')
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users =User.all
    @book = Book.new
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
    
    def ensure_current_user
      user_id = params[:id].to_i
      unless user_id == current_user.id
        redirect_to user_path(current_user.id)
      end
    end
end
