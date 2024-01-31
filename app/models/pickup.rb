class Pickup < ApplicationRecord
  belongs_to :donator, class_name: 'User', foreign_key: 'donator_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'
end
