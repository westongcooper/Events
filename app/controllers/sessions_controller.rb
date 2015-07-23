class SessionsController < ApplicationController
  def new

  end
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      if @user
        flash.now[:index] = "Wrong Password"
        redirect_to login_path, flash:{session: "Please try your password again"}
      else
        redirect_to login_path, flash:{session: "No user found"}
      end

    end
  end
  def destroy
    reset_session
    redirect_to root_path, flash:{session: "You logged out"}
  end
end
