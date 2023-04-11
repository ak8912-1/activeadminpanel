# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 10.times do |user|
#     User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', password_confirmation: '123456', role: "user") if Rails.env.development?
# end

User.create!(first_name: "Akhil", last_name: "Chovatiya", email: "akhil@example.com", password: '123456', password_confirmation: '123456', role: "admin") if Rails.env.development?