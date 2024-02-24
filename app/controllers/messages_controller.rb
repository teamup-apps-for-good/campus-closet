# frozen_string_literal: true

# Controller responsible for managing "messages" model.
class MessagesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_message, only: [:destroy]

  # creates message
  def create
    @message = current_user.messages.build(message_params)
    @message.save
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@message) }
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
    end
  end

  private

  # require message data
  def message_params
    params.require(:message).permit(:body)
  end

  # find message by id
  def set_message
    @message = Message.find(params[:id])
  end
end
