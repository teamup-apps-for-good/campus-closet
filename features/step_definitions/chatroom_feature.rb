# frozen_string_literal: true

Given('I am not logged in') do
  visit('/')
end

When('I visit the chat page for item {int}') do |item_id|
  visit("/items/#{item_id}/chatroom")
end

Given('request for item {int} uploaded by user {int} from user {int} and chatroom') do |item_id, donor_id, receiver_id|
  donor = User.find(donor_id)
  receiver = User.find(receiver_id)
  item = Item.find(item_id)
  Request.create(donor:, receiver:, item:)
  chatroom = item.build_chatroom if item.chatroom.nil?
  5.times do |i|
    Message.create(body: "Sample message #{i + 1}", user: donor, chatroom:)
  end
end

Then('I should see the chatroom') do
  expect(page).to have_content('Chatroom')
end

Then('I should not see {string}') do |val|
  expect(page).not_to have_content(val)
end

When('I fill in the text field with {string}') do |message|
  fill_in 'chat-input', with: message
end

Then('I should see the chat button') do
  # expect(page).to have_content('')
end

Then('I should see the message') do
  # expect(page).to have_content('')
end

Then('I cannot access the chat page') do
  # Implement logic to verify that the chat page is not visible
  expect(page).not_to have_content('Chatroom')
end
