# frozen_string_literal: true

# Model for Chatroom, contains database connections
class Chatroom < ApplicationRecord
  belongs_to :item
  has_many :messages, dependent: :destroy
end
