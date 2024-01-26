# frozen_string_literal: true

require_relative '../../config/environment'

Given('the following items exist:') do |table|
  table.hashes.each do |item_params|
    # DOESN'T CURRENTLY CREATE AN ITEM LIKE INTENDED
    # NEED TO TRY TO FIND A WAY TO SEARCH FOR THE ID
    # FOR THE OBJECT IN ORDER TO CREATE THE ITEM
    color = Color.create(name: item_params['color'])
    type = Type.create(name: item_params['type'])
    gender = Gender.create(name: item_params['gender'])
    status = Status.create(name: item_params['status'])
    size = Size.create(name: item_params['size'])
    condition = Condition.create(name: item_params['condition'])

    # Create the item
    Item.create(
      color_id: color&.id,
      type_id: type&.id,
      gender_id: gender&.id,
      status_id: status&.id,
      size_id: size&.id,
      condition_id: condition&.id,
      description: item_params['description'],
      image_url: 'https://pangaia.com/cdn/shop/files/Wool-Jersey-Oversized-Crew-Neck-Black-1.png?v=1694601739'
    )
  end
end

Then(/I should see "(.*)" before "(.*)"/) do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

Then(/I should see all the items/) do
  # Make sure that all the items in the app are visible in the table
  Item.all.find_each do |item|
    step %(I should see "#{item.description}")
  end
end

Given('I am on the homepage') do
  visit('/')
end

Then('I should see {int} items') do |_item_count|
  items = Item.count
  expect(items).to eq(_item_count)
end

And('I should see an item with the description {string}') do |_description|
  pending # TODO
end

Then('I should be on an item description') do
  pending # TODO
end

And('the {string} should be {string}') do |_category, _expected_cat|
  pending # TODO
end
