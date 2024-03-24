# frozen_string_literal: true

# /models
class Item < ApplicationRecord
  belongs_to :color
  belongs_to :type
  belongs_to :gender
  belongs_to :status
  belongs_to :size
  belongs_to :condition
  has_one_attached :image
  has_many :pickups
  has_many :requests
  belongs_to :user
  has_one :chatroom, dependent: :destroy
end
