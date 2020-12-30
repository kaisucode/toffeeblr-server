# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Generate main user
User.create(username: "kevin", password: "123456")

# Generate additional users.
10.times do |n|
  name = "User" + n.to_s
  User.create!(username: name, password: "password")
end

users = User.order(:created_at).take(6)
3.times do 
  title = Faker::Lorem.sentence(word_count: 5)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(title: title, content: content) }
end

