# frozen_string_literal: true

# Controller responsible for managing chat page.
class ChatPageController < ApplicationController
  def home
    @messages = Message.last(5)
    @message = current_user.messages.build
  end
end
