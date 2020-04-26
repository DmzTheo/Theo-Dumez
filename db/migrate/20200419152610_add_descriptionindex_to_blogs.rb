class AddDescriptionindexToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :descriptionindex, :string
  end
end
