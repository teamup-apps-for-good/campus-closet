class MessagesController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_message, only: [:destroy]

    def create # creates message
        @message = current_user.messages.build(message_params)
        @message.save
    end

    def destroy
        @message.destroy
    end

    private

    def message_params # require message data
        params.require(:message).permit(:body)
    end

    def set_message # find message by id
        @message = Message.find(params[:id])
    end
end
