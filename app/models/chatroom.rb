class Chatroom < ApplicationRecord
  belongs_to :item
  has_many :messages, dependent: :destroy
end
