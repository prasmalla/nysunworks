class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :ats_system_code
      t.string :location_name
      t.string :beds_number
      t.string :managed_by_name
      t.string :location_category_description
      t.datetime :open_date
      t.string :building_code
      t.string :primary_address
      t.string :city
      t.string :state_code
      t.integer :zip
      t.string :principal_name
      t.integer :principal_phone_number
      t.integer :fax_number
      t.integer :geographical_district_code
      t.timestamps null: false
    end
  end
end
