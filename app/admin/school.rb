ActiveAdmin.register School do
  includes :demographics
  # permit_params :list, :of, :attributes, :on, :model
  filter :location_name, label: 'School Name'
  filter :managed_by_name, as: :select, label: 'Type'
  filter :location_category_description , :as => :select, label: 'Category'
  filter :city, as: :select, :collection => School.uniq.pluck(:city)
  filter :geographical_district_code, as: :select, label: 'District'

  index do
    selectable_column
    column 'School Name' do |school|
      link_to school.location_name, admin_school_path(school)
    end
    column 'Type', :managed_by_name
    column 'Category', :location_category_description
    column 'Address', :primary_address
    column :city
    column :zip
    column 'Principal', :principal_name
    column 'Phone', :principal_phone_number
    column 'Fax', :fax_number
    column 'District', :geographical_district_code
  end

  show do
    panel "Demographics", only: :show do
      table_for school.demographics do
        column 'Year' do |demographic|
          link_to demographic.year, admin_demographic_path(demographic)
        end
        column :total_enrollment
        column :female
        column :male
        column :asian
        column :black
        column :hispanic
        column :other
        column :white
        column :students_with_disabilities
        column :english_language_learners
        column :poverty
      end
    end

    # attributes_table :location_name, :managed_by_name, :location_category_description, :primary_address, :city, :state_code, :zip, :principal_name, :principal_phone_number, :fax_number, :geographical_district_code
    default_main_content
  end
end
