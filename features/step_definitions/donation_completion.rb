# frozen_string_literal: true

Given('I am on the donor dashboard') do
    visit('/users/1/donor')
end

Given('I am on the student profile page') do
    visit('/')
    click_link('Student Profile')
end
  
Given('there is a request for item {int} uploaded by user {int} from user {int}') do |item_id, donor_id, receiver_id|
    donor = User.find(donor_id)
    receiver = User.find(receiver_id)
    item = Item.find(item_id)
    Request.create(donor: donor, receiver: receiver, item: item)
end
  

When('I click the current request') do
    button = find('button.confirm_pickup_button')
    sleep 1
    message = accept_confirm do
        button.click(wait: 10)
    end
end
  

Then('I should see the request destroyed') do
    # pending
end

Then('a past pickup should be created') do
    # pending # Write code here that turns the phrase above into concrete actions
end

Given('there is a past pickup for item {int} uploaded by user {int} from user {int}') do |item_id, donor_id, receiver_id|
    donor = User.find(donor_id)
    receiver = User.find(receiver_id)
    item = Item.find(item_id)
    Pickup.create(donor: donor, receiver: receiver, item: item)
end

Then('I should see a past pickup') do
  # Find the card and requests section
  card = find(".card")
  requests_heading = find("h2", text: "Current Requests")

  # Check if the card occurs before the requests section
  card_index = page.all('.card').index(card)
  requests_index = page.all('h2').index(requests_heading)
  expect(card_index).to be < requests_index
end

Then('I should not see a current request') do
    # pending # Write code here that turns the phrase above into concrete actions
end

When('I click on the request') do
    # pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the request') do
    # pending # Write code here that turns the phrase above into concrete actions
end

Then('I should not see a past pickup') do
    # pending # Write code here that turns the phrase above into concrete actions
end