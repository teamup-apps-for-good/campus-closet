# frozen_string_literal: true

# /this shows the previous requests for the item
class Request < ApplicationRecord
  belongs_to :donor, class_name: 'User', foreign_key: 'donor_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :item
  belongs_to :time_slot
  after_create :create_chatroom_for_item

  private

  def create_chatroom_for_item
    item.create_chatroom unless item.chatroom.present?
  end
end
