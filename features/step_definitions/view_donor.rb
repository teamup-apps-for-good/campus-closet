# frozen_string_literal: true

Given('the following emails have a donor account associated with them:') do |table|
  table.hashes.each do |row|
    email = row['email']
    if email.starts_with?('test_donor')
      User.create(first: 'Test', last: 'Donor', email:, student: false, donor: true)
    else
      User.create(first: 'Test', last: 'Donor2', email:, student: false, donor: true)
    end
  end
end

Given('the following emails have an account associated with them:') do |table|
  table.hashes.each do |row|
    email = row['email']
    if email.ends_with?('.com')
      User.create(first: 'Test', last: 'Donor', email:, student: false, donor: true)
    else
      User.create(first: 'Test', last: 'Student', email:, student: true, donor: false)
    end
  end
end

Given('the following student account exists:') do |table|
  table.hashes.each do |row|
    email = row['email']
    User.create(first: 'Test', last: 'Student', email:, student: true, donor: false)
  end
end

Given('the following review exists:') do |table|
  table.hashes.each do |params|
    donor = User.find_by(id: params['Donor'])
    user = User.find_by(id: params['User'])
    pickup = Pickup.find_by(id: params['Pickup'])

    Review.create(donor:, user:, pickup:, rating: params['Score'])
  end
end

Then('I will be on Test Donor donor page') do
  expect(page.current_url).to include('/users/1/donor')
end

Then('I can see {string}') do |string|
  expect(page).to have_content(string)
end

Then('I do not see {string}') do |string|
  expect(page).not_to have_content(string)
end
