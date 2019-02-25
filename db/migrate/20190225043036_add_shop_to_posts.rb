class AddShopToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :shop, :string
  end
end
