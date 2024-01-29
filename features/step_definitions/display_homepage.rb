# frozen_string_literal: true

require_relative '../../config/environment'

Given('the following items exist:') do |table|
  table.hashes.each do |item_params|
    # find the object if it exists, otherwise create a new object

    color = find_or_create(Color, item_params['color'])
    type = find_or_create(Type, item_params['type'])
    gender = find_or_create(Gender, item_params['Gender'])
    status = find_or_create(Status, item_params['Status'])
    size = find_or_create(Size, item_params['Size'])
    condition = find_or_create(Condition, item_params['Condition'])

    # Create the item
    Item.create(
      color_id: color&.id,
      type_id: type&.id,
      gender_id: gender&.id,
      status_id: status&.id,
      size_id: size&.id,
      condition_id: condition&.id,
      description: item_params['Description'],
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

Then('I should see {int} items') do |item_count|
  items = Item.count
  expect(items).to eq(item_count)
end

And('I should see an item with the description {string}') do |description|
  expect(page).to have_content(description)
end

When('I click on {string} for {string}') do |_button_text, description|
  item = Item.find_by(description:)
  visit(item_path(item))
end

Then('I should be on an item description for {string}') do |description|
  item = Item.find_by(description:)
  expect(page).to have_current_path(item_path(item))
end

And('the type should be {string}') do |expected_cat|
  expect(page).to have_content(expected_cat)
end
