class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page], per_page: 20)
  end

  def show
    @post = Post.find(params[:id])
    @related_posts = Post.where(category: @post.category_id).paginate(page: params[:page], per_page: 3)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = User.find(session[:user_id])
    @user.posts << @post
    @post.status = 'open'
    if @post.valid?
      @post.save
      flash[:notice] = "Post Created"
      redirect_to @user
    else
      puts @post.errors.messages
      flash[:notice] = "#{@post.errors.messages}"
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if
      @post.update(post_params)
      set_timer(@post)
      flash[:notice] = "Post Updated"
      redirect_to @post
    else
      render 'new'
      puts "#{@post.errors.messages}"
    end
  end


    def destroy
  @post = Post.find(params[:id])
  respond_to do |format|
    format.js
end
  @post.destroy
end

  private

  def post_params
    params.require(:post).permit(:name, :description, :category_id, :tags, :premium, :picture)
  end

  def set_timer(post)
    if post.changed.include?("status")
      if post.status = "completed"
      post.date_completed = Date.today
      end
    end
  end

end
