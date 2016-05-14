ActiveAdmin.register Demographic do
  filter :year, as: :select
  # filter :school, as: :select, :collection => School.uniq.pluck(:location_name)
end
