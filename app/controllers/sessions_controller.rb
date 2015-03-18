class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
    else
      @error = "Your username and password didn't match, please try again or create a new account!"
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
