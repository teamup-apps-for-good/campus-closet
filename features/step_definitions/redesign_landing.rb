# frozen_string_literal: true

Then('I should not see an item with the description {string}') do |description|
  expect(page).not_to have_content(description)
end
