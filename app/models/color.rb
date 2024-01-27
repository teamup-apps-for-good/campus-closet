# frozen_string_literal: true

# Color model
class Color < ApplicationRecord
  validates :name, presence: true
end
