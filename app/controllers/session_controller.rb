class SessionController < ApplicationController

  def create
    user = User.find_by email: params[:email]

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id

      # Gives access to the user id in app/channels/application_cable/connection.rb
      cookies.signed[:user_id] = session[:user_id]
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
