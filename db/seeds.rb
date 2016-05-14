# require 'faker'

# admin user
user = User.new(
  name: 'admin user',
  email: 'default@user.com',
  password: 'default1',
  role: 'admin'
)
user.skip_confirmation!
user.save!

# users
# 3.times do
#   user = User.new(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password,
#   )
#   user.skip_confirmation!
#   user.save!
# end
#
# activeadmin
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
