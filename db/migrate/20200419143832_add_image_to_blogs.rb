class AddImageToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :image, :string
  end
end
