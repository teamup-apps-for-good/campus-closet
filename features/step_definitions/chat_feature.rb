# frozen_string_literal: true

Given ("I am not logged in") do
    visit('/')
end

When ("I visit the chat page") do
    visit('chat_page/home')
end
    
Then ("I should see the chat page") do
    expect(page).to have_content('Chatroom')
end

Then ("I should not see {string}") do |val|
    expect(page).not_to have_content(val)
end

When ("I fill in the text field with {string}") do |message|
    fill_in 'chat-input', with: message
end

Then ("I should see the message") do
    # expect(page).to have_content('')
end
  
Then("I cannot access the chat page") do
    # Implement logic to verify that the chat page is not visible
    visit('chat_page/home')
    expect(page).not_to have_content('Chatroom')
end