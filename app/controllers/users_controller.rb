class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(_user_params)
    if @user.save
      log_in @user
      render :show
    else
      render :new
    end

  end

  def edit
  end

  def destroy
  end

private
  def _user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end