# frozen_string_literal: true

# /this shows the previous pickups for an item
class Pickup < ApplicationRecord
  belongs_to :donor, class_name: 'User', foreign_key: 'donor_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :item
end
