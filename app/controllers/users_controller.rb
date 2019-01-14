class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to '/users'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end



  def edit
    @user = User.find(params[:id])
  end




  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :first_name, :last_name, :premium, :location_id, :picture)
  end
end
