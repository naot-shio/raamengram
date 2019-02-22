class LikesController < ApplicationController
  before_action :authenticate_user!

  def index 
    @posts = current_user.has_liked
  end

  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    redirect_to post
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unlike(post)
    redirect_to post
  end
end