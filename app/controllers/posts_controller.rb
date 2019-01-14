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
    if @post.save
      redirect_to '/posts'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if
      @post.update(post_params)
      redirect_to '/posts'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to '/posts'
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :category_id, :user_id, :tags, :premium)
  end
end
