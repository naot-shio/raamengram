class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  

  def index
    @posts = Post.all.order('created_at DESC').page(params[:page]).per(10)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to root_url, notice: "#{@post.name} was successfully created"
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update!(post_params)
      redirect_to post, notice: "#{post.name} was successfully updated"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_url, notice: "#{post.name} was successfully deleted"
  end

  private

  def post_params
    params.require(:post).permit(:name, :price, :content, :image)
  end
end