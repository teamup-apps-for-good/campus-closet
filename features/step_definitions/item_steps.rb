# frozen_string_literal: true

require_relative '../../config/environment'

Given("the following items exist:") do |table|
  table.hashes.each do |item_params|
    # Convert string values to corresponding objects if needed
    color = Color.find_by(name: item_params['color'])
    type = Type.find_by(name: item_params['type'])
    gender = Gender.find_by(name: item_params['gender'])
    status = Status.find_by(name: item_params['status'])
    size = Size.find_by(name: item_params['size'])
    condition = Condition.find_by(name: item_params['condition'])

    # Create the item
    Item.create(
      color: color,
      type: type,
      gender: gender,
      status: status,
      size: size,
      condition: condition,
      description: item_params['description']
    )
  end
end
  
Then(/I should see "(.*)" before "(.*)"/) do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end
  
  
Then(/I should see all the items/) do
  # Make sure that all the items in the app are visible in the table
  Item.all.find_each do |item|
    step %(I should see "#{item.description}")
  end
end

Given("I am on the items page") do
  pending # TODO
end

And("I click on {string}") do |button_text|
  pending # TODO
end

And("I fill in the fields with {string}, {string}, {string}, {string}, {string}, {string}, {string}") do |color, type, description, gender, size, condition, status|
  pending # TODO
end

And("I include a picture") do
  pending # TODO
end

And("I click on {string} Item") do |button_text|
  pending # TODO
end

Then("there should be a new item in the items page") do
  pending # TODO
end

And("there should be an image") do
  pending # TODO
end

Then("I should still be on the New Item page") do
  pending # TODO
end

But("there should not be a picture") do
  pending # TODO
end

Given("I am on the homepage") do
  pending # TODO
end

Then("I should see {int} items") do |item_count|
  pending # TODO
end

Then("I should see one item with the description {string}") do |description|
  pending # TODO
end

And("I see an item with the description {string}") do |description|
  pending # TODO
end

And("I click on {string}") do |button_text|
  pending # TODO
end

Then("I should be on an item description") do
  pending # TODO
end

And('the "Type" should be {string}') do |expected_type|
  pending # TODO
end

When("I press {string}") do |filter_option|
  pending # TODO
end

And("I press {string}") do |button_text|
  pending # TODO
end

Then("I should see one item with the description {string}") do |description|
  pending # TODO
end


Given('I fill in the fields with  {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |string, string2, string3, string4, string5, string6, string7|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I fill in {string} with {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end