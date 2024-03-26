# frozen_string_literal: true

# Size model
class Size < ApplicationRecord
  validates :name, presence: true
  belongs_to :type, class_name: 'Type', foreign_key: 'type_id'
end
