class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to root_url, notice: "#{@post.name} was successfully created"
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :price, :content)
  end
end