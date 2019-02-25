class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def likes
    @user = User.find(params[:id])
    @posts = @user.has_liked
  end
end
