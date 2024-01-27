# frozen_string_literal: true

# Status model
class Status < ApplicationRecord
  validates :name, presence: true
end
