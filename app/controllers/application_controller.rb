class ApplicationController < ActionController::Base
  respond_to :html, :js

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def logged_in?
	 return true if current_user != nil
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
