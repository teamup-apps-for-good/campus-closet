# frozen_string_literal: true

class Pickup < ApplicationRecord
  belongs_to :donor, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :item, class_name: 'Item'
end
