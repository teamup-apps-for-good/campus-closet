# frozen_string_literal: true

# Controller responsible for managing chat page.
class ChatPageController < ApplicationController
  before_action :redirect_if_not_logged_in

  def home
    @messages = Message.last(5)
    @message = current_user.messages.build
  end

  def redirect_if_not_logged_in
    redirect_to root_path if current_user.nil?
  end
end
