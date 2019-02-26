class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  
  def show
    @posts = Post.where(user_id: @user.id)
  end

  def likes
    @posts = @user.has_liked
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
