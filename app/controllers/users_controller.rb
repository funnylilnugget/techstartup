class UsersController < ApplicationController

  def new
    @user = User.new
    if logged_in?
      redirect_to root_path
    else
      render 'new'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in @user
      flash[:notice] = "Account Created"
      redirect_to @user
    else
      p @user.errors.messages
      render 'new'
    end
  end


  def index
    @users = User.all
  end

  def show
  if current_user
    @user = User.find(params[:id])
  else
    redirect_to root_path
  end
end


  def edit
    @user = User.find(params[:id])

    if current_user.id != @user.id
      flash[:notice] = "this be not your account, yo"
      redirect_to root_path
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User Information Updated"
      redirect_to '/users'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :first_name, :last_name, :location_id, :picture)
  end
  
end
