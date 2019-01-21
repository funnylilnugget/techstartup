class SessionsController < ApplicationController


  def login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy

    session[:user_id] = nil
    redirect_to root_path
  end
end
