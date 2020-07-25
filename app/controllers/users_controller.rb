class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @users = User.all
    @posts = @user.posts.page(params[:page]).per(7).order("created_at DESC")
  end

end
