# frozen_string_literal: true

# Type model
class Type < ApplicationRecord
  validates :name, presence: true
end
