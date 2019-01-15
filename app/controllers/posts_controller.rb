class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.status = 'open'
    if @post.valid?
      @post.save
      flash[:notice] = "Post Created"
      redirect_to @post
    else
      puts @post
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
      redirect_to '/posts'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post Deleted"
      redirect_to '/posts'
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :category_id, :user_id, :tags, :premium, :picture)
  end

  def set_timer(post)
    if post.changed.include?("status")
      if post.status = "completed"
      post.date_completed = Date.today
      end
    end
  end

end
