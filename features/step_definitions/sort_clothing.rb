# frozen_string_literal: true

When('I select {string} from {string}') do |value, type|
  select(value, from: type.to_s)
end
