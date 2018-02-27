class RemoveImageCacheFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :image_cache, :string
  end
end
