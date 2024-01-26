# frozen_string_literal: true

Given('I am on the items page') do
  visit('/items')
end

When('I click on {string}') do |button_text|
  click_on button_text
end

When('I am on the new item page') do
  expect(page).to have_current_path('/items/new')
end

And('I fill in the fields with {string}, {string}, {string}, {string}, {string}, {string}, {string}') do
    |color, type, desc, gender, size, condition, status| # rubocop:disable Layout/ParameterLists
  select(color, from: 'item_color_id')
  select(type, from: 'item_type_id')
  fill_in 'item_description', with: desc
  select(gender, from: 'item_gender_id')
  select(size, from: 'item_size_id')
  select(condition, from: 'item_condition_id')
  select(status, from: 'item_status_id')
end

Then('there should be a new item in the items page, {int}') do |int|
  items = Item.count + 1
  expect(items).to eq(int)
end

And('I include a picture') do
  attach_file('item_image', Rails.root.join('features', 'test_image', 'shirt.jpg'))
end

When('I fill in type with {string}') do |type|
  select(type, from: 'item_type_id')
end

Then('type should still be {string}') do |type|
  expect(page).to have_select('item_type_id', selected: type)
end

But('there should not be a picture') do
  expect(page).to have_content('No image available')
end
