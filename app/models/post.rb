class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  has_one_attached :image

  def self.csv_attributes
    ["shop", "name", "price", "broth", "area", "content", "created_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |post|
        csv << csv_attributes.map{|attr| post.send(attr)}
      end
    end
  end

  def thumbnail
    return self.image.variant(combine_options: {resize: '550', gravity: 'Center', crop: '550x550+0+0'})
  end
end
