class PagesController < ApplicationController

  def home
    if !logged_in?
      redirect_to login_path
    else
      @posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    end
  end
end
