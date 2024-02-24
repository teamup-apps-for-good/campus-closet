Given('I have a student account, {string}') do |email|
    user_exists = User.where(email: email).exists?
    expect(user_exists).to eq(true)
  end
  
  When('I click {string}') do |string|
    first(string, text: string).click
  end
  
  Then('I should see the item details') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then('I should see the donors availability') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When('I click a time slot') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then('I should be sent back to the items page') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then('the donor should be notified') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When('I complete select a time to pickup') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then('a request should be successfully submitted') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then('the database should be updated appropriately') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given('I have a donor account, {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given('I have an item\(s) listed to be donated') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given('a student requests an item') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given('I go to my profile page') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then('I should see that item has been requested') do
    pending # Write code here that turns the phrase above into concrete actions
  end