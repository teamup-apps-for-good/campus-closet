# frozen_string_literal: true

# Controller responsible for managing "messages" model.
class MessagesController < ApplicationController
  # before_action :set_message, only: [:destroy]

  # creates message
  def create
    @item = Item.find(params[:item_id])
    @chatroom = @item.chatroom
    @message = current_user.messages.build(message_params)
    @message.chatroom = @chatroom
    if @message.save
      redirect_to item_chatroom_path(@item, @chatroom), notice: 'Message was successfully created.'
    else
      flash.now[:alert] = 'Failed to create message.'
      render 'chatrooms/show'
    end
  end

  # def destroy
  #   @message.destroy
  #   respond_to do |format|
  #     format.turbo_stream { render turbo_stream: turbo_stream.remove(@message) }
  #     format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
  #   end
  # end

  private

  # def set_item_and_chatroom
  #   @item = Item.find(params[:item_id])
  #   @chatroom = @item.chatroom
  # end

  # require message data
  def message_params
    params.require(:message).permit(:body)
  end

  # find message by id
  # def set_message
  #   @message = Message.find(params[:id])
  # end
end
