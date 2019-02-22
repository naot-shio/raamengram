class RankingsController < ApplicationController
  def index
    @ranking = Like.ranking
    @posts = Post.find(@ranking.keys)
  end
end
