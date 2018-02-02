class AddImageCacheToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :image_cache, :text
  end
end
