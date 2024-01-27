# frozen_string_literal: true

# Gender model
class Gender < ApplicationRecord
  validates :name, presence: true
end
