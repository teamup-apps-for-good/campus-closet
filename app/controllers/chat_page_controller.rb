# frozen_string_literal: true

class ChatPageController < ApplicationController
  # before_action :authenticate_user!

  def home
    @messages = Message.last(5)
    @message = current_user.messages.build
  end
end
