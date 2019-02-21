class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  

  def index
    @post = Post.new
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create 
    @post = current_user.posts.build(post_params)
    
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