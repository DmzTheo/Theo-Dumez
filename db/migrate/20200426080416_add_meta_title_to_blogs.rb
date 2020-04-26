class AddMetaTitleToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :meta_title, :string
  end
end
