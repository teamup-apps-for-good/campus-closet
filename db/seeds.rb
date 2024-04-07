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
  puts "Colors seeded"
end

if Type.count == 0
  clothing_types.each do |type|
    Type.create(name: type)
  end
  puts "Types seeded"
end

if Size.count == 0
  sizes.each do |type_name, size_names|
    size_names.each do |size_name|
      Size.create(name: size_name, type: Type.find_by(name: type_name))
    end
  end
  puts "Sizes seeded"
end

if Gender.count == 0
  Gender.create(name: 'Male')
  Gender.create(name: 'Female')
  Gender.create(name: 'Unisex')
  puts "Genders seeded"
end

if Status.count == 0
  Status.create(name: 'Available')
  Status.create(name: 'Unavailable')
  puts "Statuses seeded"
end

if Condition.count == 0
  Condition.create(name: 'Used')
  Condition.create(name: 'Unused')
  puts "Conditions seeded"
end

if User.count == 0
  User.create(first: "Test", last: "Donor", email: "testdonor@gmail.com", phone: "1234567890", address: "125 Spence St, College Station, TX 77840", student: false,  latitude: 30.62137515, longitude: -96.34020207698293)
  puts "Test Donor user seeded"
end

if Item.count == 0
  50.times do
    color = colors.sample
    type = clothing_types.sample
    gender = ['Male', 'Female', 'Unisex'].sample
    size = sizes[type].sample
    description = "#{color} #{type}"
    status = Status.first
    condition = Condition.first
    image_url = nil
    user = User.find_by(email: 'testdonor@gmail.com')
  
    item = Item.create(
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

    # create a new chatroom for every item created
    item.create_chatroom
  end
  if Item.count == 50
    puts "50 items seeded"
  end
end

if TimeSlot.count == 0
  5.times do
    start = DateTime.now.beginning_of_hour + rand(1..10).day
    TimeSlot.create(
        donor: User.first,
        start_time: start,
        end_time: start + 1.hours,
        status: 'available'
    )
  end
  puts "Timeslots seeded"
end

# after adding your tamu account reseed to get this pickup
if Pickup.count == 0
  user1 = User.find_by(email: 'testdonor@gmail.com')
  user2 = User.second
  item1 = Item.first
  Pickup.create(donor:user1, receiver:user2, item: item1)
  if Pickup.count != 0
    item1.update(status: Status.second)
    puts "Pickup seeded"
  end
end

# after adding your tamu account reseed to get this request
if Request.count == 0
  # replace with your own email
  user1 = User.find_by(email: 'testdonor@gmail.com')
  user2 = User.second
  item1 = Item.second
  start = DateTime.now.beginning_of_hour + 10.day
  time_slot = TimeSlot.create(
        donor: User.first,
        start_time: start,
        end_time: start + 1.hours,
        status: 'available'
    )
  Request.create(donor:user1, receiver:user2, item: item1, time_slot: time_slot)
  if Request.count != 0
    item1.update(status: Status.second)
    puts "Request seeded"
  end
end

# after you log in with your tamu account and then your gmail this will seed a pickup, request, and timeslots
if User.count == 3 && Item.last.status == Status.first
  student = User.second
  donor = User.third

  # get the last item
  item1 = Item.last
  item1.update(donor: donor)
  # get the second to last item
  item2 = Item.order(id: :desc).offset(1).limit(1).first
  item2.update(donor: donor)

  start = DateTime.now.beginning_of_hour + rand(1..10).day
  time_slot = TimeSlot.create(
    donor: donor,
    start_time: start,
    end_time: start + 1.hours,
    status: 'available'
  )

  start = start + 1.day
  TimeSlot.create(
    donor: donor,
    start_time: start,
    end_time: start + 1.hours,
    status: 'available'
  )

  Pickup.create(donor: donor, receiver: student, item: item1)
  item1.update(status: Status.second)

  Request.create(donor: donor, receiver: student, item: item2, time_slot: time_slot)
  time_slot.update(status: 'unavailable')
  item2.update(status: Status.second)
end
