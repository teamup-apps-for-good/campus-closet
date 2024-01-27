# frozen_string_literal: true

# Size model
class Size < ApplicationRecord
  validates :name, presence: true
end
