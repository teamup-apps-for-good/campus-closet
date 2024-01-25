# frozen_string_literal: true

require_relative '../../config/environment'

Given('the following items exist:') do |table|
  table.hashes.each do |item_params|
    # Convert string values to corresponding objects if needed
    color = Color.find_by(name: item_params['color'])
    type = Type.find_by(name: item_params['type'])
    gender = Gender.find_by(name: item_params['gender'])
    status = Status.find_by(name: item_params['status'])
    size = Size.find_by(name: item_params['size'])
    condition = Condition.find_by(name: item_params['condition'])

    # Create the item
    Item.create(
      color:,
      type:,
      gender:,
      status:,
      size:,
      condition:,
      description: item_params['description']
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
  pending # TODO: (same test in sort_clothing.rb)
end

Then('I should see {int} items') do |_item_count|
  pending # TODO
end

And('I should see an item with the description {string}') do |_description|
  pending # TODO
end

And('I click on {string}') do |_button_text|
  pending # TODO
end

Then('I should be on an item description') do
  pending # TODO
end

And('the {string} should be {string}') do |_category, _expected_cat|
  pending # TODO
end
