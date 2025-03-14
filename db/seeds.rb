# db/seeds.rb

require 'faker'

# Clear existing users to avoid duplication
User.destroy_all

# Get today's and tomorrow's date
today = Date.today
tomorrow = today + 1

# List of timezones for diversity
timezones = [
  "Europe/London",
  "Asia/Ho_Chi_Minh",
  "Australia/Sydney",
]

# Create 25 users with today's birthday
25.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: today,
    timezone: timezones.sample
  )
end

# Create 25 users with tomorrow's birthday
25.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: tomorrow,
    timezone: timezones.sample
  )
end

puts "✅ Seeded 50 users with birthdays on #{today} and #{tomorrow}"
