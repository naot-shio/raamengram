class RankingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @ranking = Like.ranking
    @posts = Post.find(@ranking.keys)
  end
end
