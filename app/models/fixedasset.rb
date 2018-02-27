class Fixedasset < ApplicationRecord
    validates :create_date, presence: true
    validates :asset_number, presence: true
    validates :case_name, presence: true
    validates :acquisition_date, presence: true
    validates :modeltype_name, presence: true
    validates :serial_number, presence: true
    validates :serial_number, uniqueness: true
    validates :place_summary, presence: true
    validates :place_detail, presence: true


  def self.import(file)
    CSV.foreach(file.path,encoding: 'BOM|UTF-8', headers: true) do |row|

      product  = new

      product.attributes = row.to_hash.slice(*updatable_attributes)
      
      product.save!
    end
  end

  def self.updatable_attributes
    ["create_date","asset_number","case_name","acquisition_date","modeltype_name","serial_number","place_summary","place_detail","etc_content"]
  end

end