# frozen_string_literal: true

# /this shows the previous pickups for an item
class Pickup < ApplicationRecord
  belongs_to :donor, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :item, class_name: 'Item'
end
