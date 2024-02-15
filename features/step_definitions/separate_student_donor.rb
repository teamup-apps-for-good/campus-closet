# frozen_string_literal: true

When('I click on {string} checkbox') do |donor|
  check donor
end

Then('I should see {string} on the navbar') do |dash|
  expect(page).to have_content(dash)
end

Given('I have an account, {string}, with student and donor roles') do |email|
  User.create(first: 'Test', last: 'Donor', email:, student: true, donor: true)
  user_exists = User.where(email:).exists?
  expect(user_exists).to eq(true)
end

Given('I do not see {string} on the navbar') do |donor|
  expect(page).not_to have_content(donor)
end
