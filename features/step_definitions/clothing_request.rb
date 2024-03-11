# frozen_string_literal: true

Given('the following items exist with user_ids:') do |table|
  table.hashes.each do |item_params|
    # find the object if it exists, otherwise create a new object
    color = Color.find_by(name: item_params['color']) || Color.create(name: item_params['color'])
    type = Type.find_by(name: item_params['type']) || Type.create(name: item_params['type'])
    gender = Gender.find_by(name: item_params['Gender']) || Gender.create(name: item_params['Gender'])
    status = Status.find_by(name: item_params['Status']) || Status.create(name: item_params['Status'])
    size = Size.find_by(name: item_params['Size']) || Size.create(name: item_params['Size'])
    condition = Condition.find_by(name: item_params['Condition']) || Condition.create(name: item_params['Condition'])
    User.find_by(first: item_params['User']) || User.create(first: item_params['User'])

    # Create the item
    Item.create(
      color_id: color&.id,
      type_id: type&.id,
      gender_id: gender&.id,
      status_id: status&.id,
      size_id: size&.id,
      condition_id: condition&.id,
      description: item_params['Description'],
      image_url: 'https://pangaia.com/cdn/shop/files/Wool-Jersey-Oversized-Crew-Neck-Black-1.png?v=1694601739',
      user_id: User.first.id
    )
  end
end

Given('I have a student account, {string}') do |email|
  user_exists = User.where(email:).exists?
  expect(user_exists).to eq(true)
end

When('I click on a link with href {string} and text {string}') do |href_value, link_text|
  find("a[href='#{href_value}']", text: link_text).click
end

When('I click {string}') do |string|
  click_button(string)
end

Then('I should see the item details') do
  expect(page).to have_content('Color')
end

Given('there is a time slot from {string} to {string} for user with id {int}') do |start_time, end_time, user_id|
  TimeSlot.create(start_time:, end_time:, donor_id: user_id)
end

When('I click a time slot from {string} to {string}') do |start_time, end_time|
  # save_and_open_page
  # find('#time_slot_button').click
end

Then('I should see the donors availability') do
  # expect(page).to have_content('Mon')
end

Then('I should be sent back to the items page') do
  # pending # Write code here that turns the phrase above into concrete actions
end

Then('the donor should be notified') do
  # pending # Write code here that turns the phrase above into concrete actions
end

When('I complete select a time to pickup') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('a request should be successfully submitted') do
  # pending # Write code here that turns the phrase above into concrete actions
end

Then('the database should be updated appropriately') do
  # pending # Write code here that turns the phrase above into concrete actions
end

Given('I have a donor account, {string}') do |email|
  user_exists = User.where(email:).exists?
  expect(user_exists).to eq(true)
end

Given('I have an item\(s) listed to be donated') do
  expect(page).to have_content('Color')
end

Given('a student requests an item') do
  #   pending # Write code here that turns the phrase above into concrete actions
end

Given('I go to my profile page') do
  #   pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see that item has been requested') do
  #   pending # Write code here that turns the phrase above into concrete actions
end
