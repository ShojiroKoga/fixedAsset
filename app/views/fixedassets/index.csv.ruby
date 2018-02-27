require 'csv'
require 'nkf'

bom = %w(EF BB BF).map { |e| e.hex.chr }.join

CSV.generate(bom) do |csv|
  csv_column_names = ["create_date","asset_number","case_name","acquisition_date","modeltype_name","serial_number","place_summary","place_detail","etc_content"]
  csv << csv_column_names
  @fixedassets.each do |fixedasset|
    csv_column_values = [
      fixedasset.create_date,
      fixedasset.asset_number,
      fixedasset.case_name,
      fixedasset.acquisition_date,
      fixedasset.modeltype_name,
      fixedasset.serial_number,
      fixedasset.place_summary,
      fixedasset.place_detail,
      fixedasset.etc_content
    ]
    csv << csv_column_values
  end
end

