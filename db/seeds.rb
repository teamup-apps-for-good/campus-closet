# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Color.create(name: 'Red')
Color.create(name: 'Blue')

Type.create(name: 'Pants')
Type.create(name: 'Shirt')

Gender.create(name: 'Male')
Gender.create(name: 'Female')

Status.create(name: 'Available')
Status.create(name: 'Unavailable')

Size.create(name: 'L')
Size.create(name: 'M')
Size.create(name: 'S')

Condition.create(name: 'Used')
Condition.create(name: 'Unused')

Item.create(color: Color.first, type: Type.first, gender: Gender.first, description: 'Sample description', status: Status.first, size: Size.first, condition: Condition.first, image_url: "https://campuscloset.s3.amazonaws.com/redpants.jpg")

Item.create(color: Color.second, type: Type.second, gender: Gender.second, description: 'Sample description 2', status: Status.second, size: Size.second, condition: Condition.second, image_url: "https://campuscloset.s3.amazonaws.com/blueshirt.jpg")

Item.create(color: Color.first, type: Type.second, gender: Gender.first, description: 'Sample description 3', status: Status.first, size: Size.second, condition: Condition.first, image_url: "https://campuscloset.s3.amazonaws.com/redshirt.jpg")


# more_items = [
#   {:color => Color, :type => '',
#     :gender => '', :description => 'Nice shirt',
#     :status => '', :size => '', :condition => ''},
  
# ]

# more_items.each do |item|
#   Item.create!(item)
# end