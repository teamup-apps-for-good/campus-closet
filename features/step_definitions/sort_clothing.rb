# frozen_string_literal: true

When('I press {string}') do |string|
  find('label', text: string).click(wait: 10)
end
