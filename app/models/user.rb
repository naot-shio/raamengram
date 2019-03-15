class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :has_liked, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  
  def like(post)
    self.likes.find_or_create_by(post_id: post.id)
  end

  def unlike(post)
    like = self.likes.find_by(post_id: post.id)
    like.destroy if like
  end

  def has_liked?(post)
    self.has_liked.include?(post)
  end
end
