class AddChatroomIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :chatroom, null: false, foreign_key: true
  end
end
