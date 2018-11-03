class UsersController < ApplicationController
  before_action :fetch_user

  def new
    @user = User.new
  end

  def create
    user = User.create user_params

    if user.persisted?
      session[:user_id] = user.id
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
    redirect_to login_path
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    unless @user == @current_user
      redirect_to user_path(@current_user)
      return
    end

    if @user.update(user_params)
      return
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
