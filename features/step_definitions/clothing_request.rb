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
    user = User.find_by(id: item_params['User'].to_i) || User.create(first: 'Test', last: 'User')

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
      user_id: user&.id
    )
  end
end

Given('I am logged in as a student') do
  User.create(first: 'Test', last: 'Student', email: 'test_student@tamu.edu', student: true, donor: false)
  visit('/')
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(
    :google_oauth2,
    info: { first: 'Test', last: 'Student', email: 'test_student@tamu.edu' }
  )
  click_on 'Login with Google'
end

Given('I am logged in as a donor') do
  User.create(first: 'Test', last: 'Donor', email: 'test_donor@gmail.com', student: false, donor: true)
  visit('/')
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(
    :google_oauth2,
    info: { first: 'Test', last: 'Donor', email: 'test_donor@gmail.com' }
  )
  click_on 'Login with Google'
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
  TimeSlot.create(start_time:, end_time:, donor_id: user_id, status: 'available')
end

When('I click a time slot from {string} to {string}') do |_start_time, _end_time|
  refresh
  button_text_before_click = find('#time_slot_button').text
  puts "Button text before click: #{button_text_before_click}"

  message = accept_confirm do
    # Wait for the confirmation dialog to appear
    find('#time_slot_button').click
  end
  expect(message).to eq('Are you sure you want to request this timeslot?')
  sleep 2
end

Then('I should see the donors availability') do
  expect(page).to have_content('Mon')
end

Then('I should be sent back to the items page') do
  # save_and_open_page
  click_link('Student Profile')
end

Then('the donor should be notified') do
  # pending # Write code here that turns the phrase above into concrete actions
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
