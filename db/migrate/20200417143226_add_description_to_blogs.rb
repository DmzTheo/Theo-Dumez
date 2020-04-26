class AddDescriptionToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :description, :text
  end
end
