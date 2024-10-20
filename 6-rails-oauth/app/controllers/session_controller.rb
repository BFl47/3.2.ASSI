class SessionController < ApplicationController
  def create
    #raise StandardError.new(ENV["omniauth.auth"])
    auth = request.env["omniauth.auth"]
    user = Moviegoer.from_omniauth(auth)
    session[:user_id] = user.uid
    flash[:notice] = "Logged in successfully."
    redirect_to movies_path
    
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to movies_path
  end

  def fail
    #raise StandardError.new(ENV["omniauth.auth"])
    flash[:error] = "Authentication failed."
    redirect_to movies_path
  end
end
