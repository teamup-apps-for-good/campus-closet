# frozen_string_literal: true

Given('I am a logged in donor') do
  User.create(first: 'Test', last: 'Donor', email: 'testdonor@gmail.com', student: false, donor: true)
  visit('/')
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(
    :google_oauth2,
    info: { email: 'testdonor@gmail.com' }
  )
  click_on 'Login with Google'
end

Given('I am on the Dashboard') do
  dash = "/users/#{page.driver.request.session['user_id']}/donor"
  visit(dash)
end

When('I fill in the {string} field with {string}') do |field, val|
  fill_in field, with: val
end

Then('I should see {string} as my {string}') do |val, _string2|
  expect(page).to have_content(val)
end
