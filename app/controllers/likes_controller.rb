class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, except: :index

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

  def find_post
    post = Post.find(params[:post_id])
  end
end