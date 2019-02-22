class ApplicationController < ActionController::Base

  private

  def counter(post)
    @count_likes = post.likes.count
  end
end
