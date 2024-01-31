# frozen_string_literal: true

# /this shows the previous requests for the item
class Request < ApplicationRecord
  belongs_to :donor, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :item, class_name: 'Item'
end
