class SessionsController < ApplicationController

  def login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    end
  end

  def destroy
    user = current_user
    log_out user
    redirect_to '/'
  end

end
