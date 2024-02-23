# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { User.create(email: 'example@gmail.com', first: 'User1') }
  let(:valid_message_params) { { message: { body: 'Hello, world!' } } }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new message' do
        expect do
          post :create, params: valid_message_params, session: { user_id: user.id }
        end.to change(Message, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:message) { Message.create(body: 'Hello, world!', user_id: user.id) }

    it 'destroys the requested message' do
      expect do
        delete :destroy, params: { id: message.id }, session: { user_id: user.id }
      end.to change(Message, :count).by(-1)
    end

    it 'redirects to the messages_url' do
      delete :destroy, params: { id: message.id }, session: { user_id: user.id }
      expect(response).to redirect_to(messages_url)
    end
  end
end
