class UserController < ApplicationController

  before_action :current_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user= User.new
  end

  def create
    user = User.create(user_params)
    redirect_to user_index_url
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_index_url
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def current_user
    @user = User.find(params[:id])
  end
end
