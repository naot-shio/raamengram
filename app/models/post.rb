class Post < ApplicationRecord
  has_one_attached :image

  # def thumbnail
  #   return self.image.variant(combine_options: {gravity: 'Center', crop: '180x135+0+0'}) %>
  # end
end
