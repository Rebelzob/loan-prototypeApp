# db/seeds.rb
require 'faker'

# Clear existing users
puts "Clearing existing users..."
User.destroy_all

# Create 100 users
puts "Creating 100 users..."
100.times do |i|
  User.create!(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    comments: Faker::Lorem.paragraph(sentence_count: 2)
  )
  print "." if (i + 1) % 10 == 0
end

puts "\nCreated #{User.count} users!"
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?