# frozen_string_literal: true

Given('the following pickup exists:') do |table|
  table.hashes.each do |item_params|
    donor = User.find_by(id: item_params['Donor'].to_i)
    user = User.find_by(id: item_params['User'].to_i)
    item = Item.find_by(id: item_params['Item'])

    Pickup.create(donor:, receiver: user, item:)
  end
end

Given('a past pickup exists') do
  expect(page).to have_content('Donor')
end

Then('I should be on the review page') do
  expect(page.current_url).to include('/reviews')
end

When('I fill in rating with {string}') do |rating|
  fill_in 'review_rating', with: rating
end

Then('I should go back to the Profile Page') do
  expect(page.current_url).to include('/users/2/student')
end

Then('I should see a {string} for the review') do |rating|
  expect(page).to have_content("Donor Rating: #{rating}")
end

Then('I should still be on the review page') do
  expect(page.current_url).to include('/reviews')
end
