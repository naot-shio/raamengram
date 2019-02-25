class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @post
    else
      redirect_to @post
    end
  end

  def destroy
    @comment = Commment.find(params[:id])
    @comment.destroy, notice: "Your comment was successfully deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
