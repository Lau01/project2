class SessionController < ApplicationController

  def create
    user = User.find_by email: params[:email]

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      cookies.signed[:user_id] = session[:user_id]   # for access to user id in ActionCable
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.signed[:user_id] = nil
    redirect_to login_path
  end
end
