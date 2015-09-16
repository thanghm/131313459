# require 'faker'

# # Create Users
# 5.times do
#   user = User.new(
#     name:     Faker::Name.name,
#     email:    Faker::Internet.email,
#     password: Faker::Lorem.characters(5)
#   )
#   user.skip_confirmation!
#   user.save!
# end
# users = User.all

# # Note: by calling `User.new` instead of `create`,
# # we create an instance of User which isn't immediately saved to the database.

# # The `skip_confirmation!` method sets the `confirmed_at` attribute
# # to avoid triggering an confirmation email when the User is saved.

# # The `save` method then saves this User to the database.


# # Create Topics
# 15.times do
#   Topic.create!(
#     name:         Faker::Lorem.sentence,
#     description:  Faker::Lorem.paragraph
#   )
# end
# topics = Topic.all

# # Create Posts
# 50.times do
#   post = Post.create!(
#     topic:  topics.sample,
#     title:  Faker::Lorem.sentence,
#     body:   Faker::Lorem.paragraph
#   )

#   # set the created_at to a time within the past year
#   post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
# end
# posts = Post.all


# # Create an admin user
# admin = User.new(
#   name:     'Admin User',
#   email:    'admin@example.com',
#   password: '12345678',
#   role:     'admin'
# )
# admin.skip_confirmation!
# admin.save!

# # Create a develop
# develop = User.new(
#   name:     'Develop User',
#   email:    'develop@example.com', 
#   password: '12345678',
#   role:     'develop'
# )
# develop.skip_confirmation!
# develop.save!

# # Create a member
# member = User.new(
#   name:     'Member User',
#   email:    'member@example.com',
#   password: '12345678',
# )
# member.skip_confirmation!
# member.save!

# puts "Seed finished"
# puts "#{User.count} users created"
# puts "#{Post.count} posts created"
#topic = Topic.create([{ topic: 'Thoi su' }, { topic: 'The gioi' }, { topic: 'Kinh doanh' }, { topic: 'Giai tri' }, { topic: 'The thao'}, { topic: 'Phap luat'}, { topic: 'Giao duc'}, { topic: 'Suc khoe'}])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# post = Post.create([{title: 'laman', body: 'chiem', published: true}])
# user = User.create([{email: '123@qwe.com', password: '12345678'}])