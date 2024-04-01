# frozen_string_literal: true

# require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { User.create(email: 'example@gmail.com', first: 'User1') }
  let(:item) { create_item(user) }
  let!(:chatroom) { Chatroom.create(item:) }
  let(:valid_message_params) { { message: { body: 'Hello, world!' } } }

  describe 'POST #create' do
    context 'when user is logged in' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'creates a new message' do
        expect do
          post :create, params: { item_id: item.id, message: { body: 'Test message' } }
        end.to change(Message, :count).by(1)
      end

      it 'redirects to the chatroom page after creating a message' do
        post :create, params: { item_id: item.id, message: { body: 'Test message' } }
        expect(response).to redirect_to(item_chatroom_path(item, chatroom))
        expect(flash[:notice]).to eq('Message was successfully created.')
      end

      it 'renders chatroom/show template when message creation fails' do
        post :create, params: { item_id: item.id, message: { body: '' } }
        expect(response).to render_template('chatrooms/show')
        expect(flash[:alert]).to eq('Failed to create message.')
      end
    end

    # context 'when user is not logged in' do
    #   it 'redirects to the root path' do
    #     post :create, params: { item_id: item.id, message: { body: 'Test message' } }
    #     expect(response).to redirect_to(root_path)
    #   end
    # end
  end
end
