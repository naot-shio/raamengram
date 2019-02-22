class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.ranking
    self.group(:post_id).order('count_post_id DESC').count(:post_id)
  end
end
