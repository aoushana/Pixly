class UsersController < ApplicationController

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    #user_params = an object literal
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successfully registered"
      redirect_to @user
    else
      render 'new'
    end
  end

  def remove_photo
    @user = User.find(params[:id])
    @user.photo = nil
    @user.save
    redirect_to @user, flash: { success: 'User profile photo has been removed.' }
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
