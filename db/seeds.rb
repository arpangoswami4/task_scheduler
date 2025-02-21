# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!([
  {email: "arpan.goswami@gmail.com",
  password: "$2a$12$0gONh7ETi7G0y1stdXOgq.zbeMC150/GEUpbbuvEvvlwZx4hTPpke", #123qwe4r
  name: "Test",
  role: "viewer"},
  {email: "arpan.goswami20@gmail.com",
  password: "$2a$12$p.3JdUdAiAxGCW5HycqydOYZ6NdobiRcUYgWiql9HTa7Goz9.Sdwu", #123qwe4r
  name: "Arpan",
  role: "super_admin"
}])

# 30.times do |i|
#   Task.create!(
#     title: "#{i} Title",
#     description: "#{i.ordinalize} describing",
#     status: i%3,
#     due_date: Time.current + i.day * 2,
#     user: User.second
#   )
# end

# (31..60).each do |i|
#   Task.create!(
#     title: "#{i} Title",
#     description: "#{i.ordinalize} describing",
#     status: i%3,
#     due_date: Time.current + i.hour * 12,
#     user: User.first
#   )
# end