class PagesController < ApplicationController
before_action :reset_session

  def home
    if !logged_in?
      redirect_to login_path
    end
  end
end
