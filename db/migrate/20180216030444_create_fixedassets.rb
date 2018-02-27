class CreateFixedassets < ActiveRecord::Migration[5.1]
  def change
    create_table :fixedassets do |t|
      t.string :create_date
      t.integer :asset_number
      t.string :case_name
      t.string :acquisition_date
      t.string :modeltype_name
      t.string :serial_number
      t.string :place_summary
      t.string :place_detail
      t.text :etc_content

      t.timestamps
    end
  end
end
