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

When('I click {string}') do |_string|
  pending
end

Then('I should be logged in successfully') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be put on the account creation page') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be put on the homepage') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I have an account, {string}') do |email|
  user_exists = User.where(email:).exists?
  expect(user_exists).to eq(true)
end

Given('I do not have an account already, {string}') do |email|
  user_exists = User.where(email:).exists?
  expect(user_exists).to eq(false)
end
