# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

99.times do |n|
    name = Faker::Name.name
    email = "example-#{n + 1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
  
  User.create!(
    name: "Jose",
    email: "test@test.com",
    password: "password",
    password_confirmation: "password",
  )
  User.create!(
    name: "admin",
    email: "admin@admin.com",
    password: "password",
    password_confirmation: "password",
    admin: 1
  )
  20.times do |n|
    title = Faker::Game.platform
    description = Faker::Lorem.sentence
    category = Category.create!(title: title,
                                description: description)
  
    5.times do
      word = category.words.build content: Faker::Game.title
      word.choices = [
        Choice.new(content: Faker::Game.genre, correct: false),
        Choice.new(content: Faker::Game.genre, correct: true),
        Choice.new(content: Faker::Game.genre, correct: false),
      ].shuffle
      word.save(validate: false)
    end
  end
  
  
  
  puts "Seeding done."