# frozen_string_literal: true

# Condition model
class Condition < ApplicationRecord
  validates :name, presence: true
end
