# frozen_string_literal: true

# Controller responsible for managing chat page.
class ChatroomsController < ApplicationController
  before_action :set_item_and_chatroom, only: [:show]
  before_action :redirect_if_not_logged_in

  def show
    @messages = @chatroom.messages.last(5)
    @message = current_user.messages.build
  end

  def create
    @item = Item.find(params[:item_id])
    @chatroom = @item.build_chatroom
    if @chatroom.save
      redirect_to item_chatroom_path(@item), notice: 'Chatroom created successfully.'
    else
      redirect_to root_path, notice: 'Error creating chatroom.'
    end
  end

  private

  def set_item_and_chatroom
    @item = Item.find(params[:item_id])
    @chatroom = @item.chatroom
  end

  def redirect_if_not_logged_in
    redirect_to root_path if current_user.nil?
  end
end
