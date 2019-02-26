class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  before_action :find_post, only: [:show, :edit, :update]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.csv {send_data @posts.generate_csv, filename: "posts-#{Date.today}.csv"}
    end
  end

  def show
    counter(@post)
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create 
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to root_url, notice: "#{@post.name} was successfully created"
    else
      flash.now[:danger] = 'Failed to create a post'
      render :new
    end
  end

  def update
    if @post.update!(post_params)
      redirect_to @post, notice: "#{@post.name} was successfully updated"
    else
      redirect_to @post, notice: "Failed to create a post"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_url, notice: "#{post.name} was successfully deleted"
  end

  private

  def post_params
    params.require(:post).permit(:name, :price, :content, :image, :broth, :area, :shop)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end