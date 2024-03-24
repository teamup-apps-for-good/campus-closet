# frozen_string_literal: true

# "Messages" model. Contains max character length and attributes.
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  validates :body, presence: true, length: { maximum: 500 }

  after_create_commit :broadcast_create
  after_destroy_commit :broadcast_destroy

  def broadcast_create
    # broadcast to all users the message partial
    broadcast_append_to 'messages',
                        partial: 'messages/message',
                        locals: { message: self, display_controls: false }

    # broadcast the user controls to message_id_user_id_controls
    broadcast_replace_to "user_#{user.id}",
                         target: "message_#{id}_controls",
                         partial: 'messages/controls',
                         locals: { message: self }
  end

  def broadcast_destroy
    # broadcast to all users the message partial
    broadcast_remove_to 'messages'
  end
end
