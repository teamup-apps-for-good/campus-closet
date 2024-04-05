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

colors = [
  'Black', 'White', 'Gray', 'Navy', 'Blue', 'Light Blue', 'Dark Blue', 'Teal', 'Aqua', 'Turquoise',
  'Green', 'Light Green', 'Dark Green', 'Yellow', 'Orange', 'Red', 'Maroon', 'Burgundy',
  'Pink', 'Purple', 'Lavender', 'Brown', 'Beige', 'Cream', 'Tan'
]

clothing_types = [
  'Shirt', 'Pants', 'Jacket', 'Dress', 'Skirt', 'Shorts', 'Blouse', 'Suit', 'Hoodie', 'Cardigan', 'Blazer', 'Vest', 'Polo', 'Leggings'
]

sizes = {
  'Shirt' => ['XS', 'S', 'M', 'L', 'XL'],
  'Pants' => ['30x30', '32x30', '34x30', '36x30', '38x30', '30x32', '32x32', '34x32', '36x32', '38x32', '30x34', '32x34', '34x34', '36x34', '38x34'],
  'Jacket' => ['XS', 'S', 'M', 'L', 'XL'],
  'Dress' => ['XS', 'S', 'M', 'L', 'XL'],
  'Skirt' => ['XS', 'S', 'M', 'L', 'XL'],
  'Shorts' => ['XS', 'S', 'M', 'L', 'XL'],
  'Blouse' => ['XS', 'S', 'M', 'L', 'XL'],
  'Suit' => ['XS', 'S', 'M', 'L', 'XL'],
  'Hoodie' => ['XS', 'S', 'M', 'L', 'XL'],
  'Cardigan' => ['XS', 'S', 'M', 'L', 'XL'],
  'Blazer' => ['XS', 'S', 'M', 'L', 'XL'],
  'Vest' => ['XS', 'S', 'M', 'L', 'XL'],
  'Polo' => ['XS', 'S', 'M', 'L', 'XL'],
  'Leggings' => ['XS', 'S', 'M', 'L', 'XL']
}

if Color.count == 0
  colors.each do |color|
    Color.create(name: color)
  end
end

if Type.count == 0
  clothing_types.each do |type|
    Type.create(name: type)
  end
end

if Size.count == 0
  sizes.each do |type_name, size_names|
    size_names.each do |size_name|
      Size.create(name: size_name, type: Type.find_by(name: type_name))
    end
  end
end

if Gender.count == 0
  Gender.create(name: 'Male')
  Gender.create(name: 'Female')
  Gender.create(name: 'Unisex')
end

if Status.count == 0
  Status.create(name: 'Available')
  # Status.create(name: 'Unavailable')
end

if Condition.count == 0
  Condition.create(name: 'Used')
  Condition.create(name: 'Unused')
end

if User.count == 0
  User.create(first: "Test", last: "Donor", email: "testdonor@gmail.com", phone: "1234567890", address: "125 Spence St, College Station, TX 77840", student: false,  latitude: 30.62137515, longitude: -96.34020207698293)
  User.create(first: "Test", last: "Receiver", email: "testreceiver@tamu.edu", phone: "0987654321", address: "907 Cross St, College Station, TX 77840", student: true, latitude: 30.62427312244898, longitude: -96.3443647755102)
end

if Item.count == 0
  50.times do
    color = colors.sample
    type = clothing_types.sample
    gender = ['Male', 'Female', 'Unisex'].sample
    size = sizes[type].sample
    description = 'Sample description'
    status = Status.first
    condition = Condition.first
    image_url = 'https://campuscloset.s3.amazonaws.com/redpants.jpg'
    user = User.find_by(email: 'testdonor@gmail.com')
  
    Item.create(
      color: Color.find_by(name: color),
      type: Type.find_by(name: type),
      gender: Gender.find_by(name: gender),
      description: description,
      status: status,
      size: Size.find_by(name: size, type: Type.find_by(name: type)),
      condition: condition,
      image_url: image_url,
      user: user
    )
  end
end

if Pickup.count == 0
  # replace with your own email
  user1 = User.find_by(email: 'nitin.pendekanti@gmail.com')
  user2 = User.find_by(email: 'nitinpendekanti@tamu.edu')
  user3 = User.find_by(email: 'testdonor@gmail.com')
  user4 = User.find_by(email: 'teststudent@tamu.edu')
  item1 = Item.find_by(description: 'Sample description 3')
  item2 = Item.find_by(description: 'Sample description')
  Pickup.create(donor:user1, receiver:user2, item: item1)
  Pickup.create(donor:user3, receiver:user4, item: item2)
end

if Request.count == 0
  # replace with your own email
  user1 = User.find_by(email: 'nitin.pendekanti@gmail.com')
  user2 = User.find_by(email: 'nitinpendekanti@tamu.edu')
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

Item.all.each do |item|
  # Create a chatroom associated with the current listing
  item.create_chatroom
end

# more_items = [
#   {:color => Color, :type => '',
#     :gender => '', :description => 'Nice shirt',
#     :status => '', :size => '', :condition => ''},

# ]

# more_items.each do |item|
#   Item.create!(item)
# end
