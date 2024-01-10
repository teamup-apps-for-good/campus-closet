class Item < ApplicationRecord
  belongs_to :color
  belongs_to :type
  belongs_to :gender
  belongs_to :status
  belongs_to :size
  belongs_to :condition
end
