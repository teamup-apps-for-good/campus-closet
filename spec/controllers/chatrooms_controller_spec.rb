# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatroomsController, type: :controller do
  describe 'GET #show' do
    context 'when user is logged in' do
      let(:user) { User.create(email: 'example@gmail.com', first: 'User1') }
      let(:item) do
        user.items.create(color: Color.create(name: 'color1'), type: Type.create(name: 'type1'),
                          gender: Gender.create(name: 'gender1'), status: Status.create(name: 'status1'),
                          size: Size.create(name: 'size1', type_id: Type.first.id),
                          condition: Condition.create(name: 'condition1'))
      end
      let!(:chatroom) { Chatroom.create(item:) }
      let!(:messages) do
        10.times { |i| Message.create(body: "Message #{i + 1}", user:, chatroom:) }
      end

      before do
        allow(controller).to receive(:current_user).and_return(user)
        get :show, params: { item_id: item.id } # Pass the item_id parameter
      end

      it 'assigns @messages with the last 5 messages' do
        expect(assigns(:messages)).to eq(Message.last(5))
      end

      it 'assigns a new message to @message' do
        expect(assigns(:message)).to be_a_new(Message)
        expect(assigns(:message).user).to eq(user)
      end

      it 'renders the :show template' do
        expect(response).to render_template(:show)
      end
    end
  end

  describe 'POST #create' do
    let(:user) { User.create(email: 'example@gmail.com', first: 'User1') }
    let(:item) do
      user.items.create(color: Color.create(name: 'color1'), type: Type.create(name: 'type1'),
                        gender: Gender.create(name: 'gender1'), status: Status.create(name: 'status1'),
                        size: Size.create(name: 'size1', type_id: Type.first.id),
                        condition: Condition.create(name: 'condition1'))
    end

    context 'with valid parameters' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        post :create, params: { item_id: item.id }
      end

      it 'creates a new chatroom' do
        expect(Chatroom.count).to eq(1)
      end

      it 'redirects to the item chatroom path with notice message' do
        expect(response).to redirect_to(item_chatroom_path(item))
        expect(flash[:notice]).to eq('Chatroom created successfully.')
      end
    end

    context 'with invalid parameters' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        allow_any_instance_of(Chatroom).to receive(:save).and_return(false)
        post :create, params: { item_id: item.id }
      end

      it 'redirects to the root path with notice message' do
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Error creating chatroom.')
      end
    end
  end
end
