class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def thumbnail
    return self.image.variant(combine_options: {resize: '550', gravity: 'Center', crop: '550x550+0+0'})
  end
end
