# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
if Color.count == 0
  Color.create(name: 'Red')
  Color.create(name: 'Blue')
end

if Type.count == 0
  Type.create(name: 'Pants')
  Type.create(name: 'Shirt')
end

if Gender.count == 0
  Gender.create(name: 'Male')
  Gender.create(name: 'Female')
end

if Status.count == 0
  Status.create(name: 'Available')
  Status.create(name: 'Unavailable')
end

if Size.count == 0
  Size.create(name: 'L')
  Size.create(name: 'M')
  Size.create(name: 'S')
end

if Condition.count == 0
  Condition.create(name: 'Used')
  Condition.create(name: 'Unused')
end

if User.count == 0
  User.create(first: "Test", last: "Donor", email: "testdonor@gmail.com", phone: "1234567890", address: "College Station, TX", student: false)
  User.create(first: "Test", last: "Student", email: "teststudent@tamu.edu", phone: "0987654321", address: "College Station, TX", student: true)
end

if Item.count == 0
  donor = User.find_by(email: "testdonor@gmail.com")

  Item.create(color: Color.first, type: Type.first, gender: Gender.first, description: 'Sample description',
              status: Status.first, size: Size.first, condition: Condition.first, image_url: 'https://campuscloset.s3.amazonaws.com/redpants.jpg', user: donor)

  Item.create(color: Color.second, type: Type.second, gender: Gender.second, description: 'Sample description 2',
              status: Status.second, size: Size.second, condition: Condition.second, image_url: 'https://campuscloset.s3.amazonaws.com/blueshirt.jpg', user: donor)

  Item.create(color: Color.first, type: Type.second, gender: Gender.first, description: 'Sample description 3',
              status: Status.first, size: Size.second, condition: Condition.first, image_url: 'https://campuscloset.s3.amazonaws.com/redshirt.jpg', user: donor)
end

if Pickup.count == 0
  # replace with your own email
  # user1 = User.find_by(email: 'hunterpearson36@gmail.com')
  # user2 = User.find_by(email: 'hunter-pearson_36@tamu.edu')
  user3 = User.find_by(email: 'testdonor@gmail.com')
  user4 = User.find_by(email: 'teststudent@tamu.edu')
  item1 = Item.find_by(description: 'Sample description 3')
  item2 = Item.find_by(description: 'Sample description')
  Pickup.create(donor:user1, receiver:user2, item: item1)
  Pickup.create(donor:user3, receiver:user4, item: item2)
end

if Request.count == 0
  # replace with your own email
  # user1 = User.find_by(email: 'hunterpearson36@gmail.com')
  # user2 = User.find_by(email: 'hunter-pearson_36@tamu.edu')
  user3 = User.find_by(email: 'testdonor@gmail.com')
  user4 = User.find_by(email: 'teststudent@tamu.edu')
  item1 = Item.find_by(description: 'Sample description 3')
  item2 = Item.find_by(description: 'Sample description')
  Request.create(donor:user1, receiver:user2, item: item1)
  Request.create(donor:user3, receiver:user4, item: item2)
end

# chat seeding
# 50.times do
#   Message.create(
#   body: Faker::Lorem.sentence(word_count: 10),
#   user_id: rand(1..3))
# end
if TimeSlot.count == 0
  donor_user = User.find_by(email: 'testdonor@gmail.com')

  TimeSlot.create([
    {
      donor: donor_user,
      start_time: DateTime.now.beginning_of_hour + 1.day,
      end_time: DateTime.now.beginning_of_hour + 25.hours,
      status: 'available'
    },
    {
      donor: donor_user,
      start_time: DateTime.now.beginning_of_hour + 2.days,
      end_time: DateTime.now.beginning_of_hour + 49.hours,
      status: 'available'
    }
  ])
end

# more_items = [
#   {:color => Color, :type => '',
#     :gender => '', :description => 'Nice shirt',
#     :status => '', :size => '', :condition => ''},

# ]

# more_items.each do |item|
#   Item.create!(item)
# end
