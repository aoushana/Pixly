class SessionsController < ApplicationController
  def new
  end

  def create
    #params is an object with one key called session with three keys called username, pw, and remember me.
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in @user
      # the value of is '1' if the box is checked and '0' if it hasn't
      # we can now remember or forget the user
      # params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user
    else
     flash.now[:danger] = 'Invalid email/password combination' #not quite right # Create an error message.
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end


