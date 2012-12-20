class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  # save user id in session
  # redirect to home
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
