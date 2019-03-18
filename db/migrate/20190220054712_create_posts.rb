class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.string :broth
      t.string :shop
      t.string :area

      t.timestamps
    end
  end
end
