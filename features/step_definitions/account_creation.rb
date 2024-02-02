# frozen_string_literal: true

Given('the following emails have an account associated with them:') do |table|
  table.hashes.each do |row|
    email = row['email']
    if email.ends_with?('.com')
      User.create(first: 'Test', last: 'Donor', email:, student: false)
    else
      User.create(first: 'Test', last: 'Student', email:, student: true)
    end
  end
end

Given('I am on the Login page') do
  visit('/')
end

When('I click {string}, {string}') do |link, email|
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(
    :google_oauth2,
    info: { email: }
  )
  click_on link
end

Then('I should be logged in') do
  expect(page.driver.request.session['user_id']).to_not be_nil
end

Then('I should be put on the account creation page') do
  pending
end

Then('I should be put on the homepage') do
  expect(page).to have_current_path('/')
end

Given('I have an account, {string}') do |email|
  user_exists = User.where(email:).exists?
  expect(user_exists).to eq(true)
end

Given('I do not have an account already, {string}') do |email|
  user_exists = User.where(email:).exists?
  expect(user_exists).to eq(false)
end
