class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to 'users/index'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to 'users/index'
    end
  end



  private
  def user_params
    params(:post).permit(:email, :username, :password, :first_name, :last_name, :premium, :last_name, :location_id)
  end
end
