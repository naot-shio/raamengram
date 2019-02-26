class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
   
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @post
    else
      redirect_to @post
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy if @comment
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
