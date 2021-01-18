# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rails.logger.info '=== CREATING TEACHERS ==='
teachers = []

10.times do
  teachers << Teacher.create(
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.unique.email
  )
end

Rails.logger.info '=== CREATING COURSES ==='
5.times do
  Course.create(name: Faker::Job.unique.title)
end
