class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(7)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def search
    @search = Post.search(params[:keyword])
  end

  private
  def post_params
    params.require(:post).permit(:constructionsite,:writer,:industrytype,:members,:comment,:highway,:endtime,:overwork).merge(user_id: current_user.id)
  end

end
