class AddBrothToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :broth, :string
  end
end
