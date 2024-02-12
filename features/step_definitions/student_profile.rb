# frozen_string_literal: true

# A lot of overlap with the donor dashboard feature

Given('I am a logged in student') do
  User.create(first: 'Test', last: 'Student', email: 'teststudent@tamu.edu', student: true, donor:false)
  visit('/')
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(
    :google_oauth2,
    info: { email: 'teststudent@tamu.edu' }
  )
  click_on 'Login with Google'
end

Then('I should see {string}') do |listing|
  expect(page).to have_content(listing)
end

Then('I should see my account details') do
  expect(page).to have_content('Account Details')
end

Given('I am on the Profile Page') do
  dash = "/users/#{page.driver.request.session['user_id']}/student"
  visit(dash)
end
