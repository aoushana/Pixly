class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    else
     flash.now[:danger] = 'Invalid email/password combination' #not quite right # Create an error message.
      render "new"
  end

  def destroy
  end
end
