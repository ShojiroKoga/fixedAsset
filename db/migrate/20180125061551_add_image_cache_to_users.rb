class AddImageCacheToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image_cache, :text
  end
end
