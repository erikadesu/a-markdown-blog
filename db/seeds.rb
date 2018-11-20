# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts "creating some users"
# 3.times do |u|
#   user = User.create!(
#     username: Faker::Pokemon.name,
#     email: Faker::Internet.email,
#     password: "naomehackeie")
# end

puts "creating some posts"
8.times do |i|
  post = Post.create!(
    title: Faker::RuPaul.quote,
    content_raw: Faker::Markdown.random,
    user_id: rand(1..3)
    )
end
puts "phew..done!"
