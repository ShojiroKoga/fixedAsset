class ChangeDatatypeAssetNumberOfFixedassets < ActiveRecord::Migration[5.1]
  def change
    change_column :fixedassets, :asset_number, :string
  end
end
