# frozen_string_literal: true

Given('I am on the items page') do
  visit('/items')
end

When('I click on {string}') do |_button_text|
  pending # TODO
end

And('I fill in the fields with {string}, {string}, {string}, {string}, {string}, {string}, {string}') do
    |_color, _type, _description, _gender, _size, _condition, _status| # rubocop:disable Layout/ParameterLists
  pending # TODO
end

And('I include a picture') do
  pending # TODO
end

Then('there should be a new item in the items page') do
  pending # TODO
end

And('there should be an image') do
  pending # TODO
end

When('I fill in {string} with {string}') do |_string, _string2|
  pending # TODO
end

Then('I should still be on the New Item page') do
  pending # TODO
end

But('there should not be a picture') do
  pending # TODO
end
