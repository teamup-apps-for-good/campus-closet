# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatPageController, type: :controller do
  describe 'GET #home' do
    context 'when user is logged in' do
      let(:user) { User.create(email: 'example@gmail.com', first: 'User1') }
      let!(:messages) do
        10.times { |i| Message.create(body: "Message #{i + 1}", user:) }
      end

      before do
        allow(controller).to receive(:current_user).and_return(user)
        get :home
      end

      it 'assigns @messages with the last 5 messages' do
        expect(assigns(:messages)).to eq(Message.last(5))
      end

      it 'assigns a new message to @message' do
        expect(assigns(:message)).to be_a_new(Message)
        expect(assigns(:message).user).to eq(user)
      end

      it 'renders the :home template' do
        expect(response).to render_template(:home)
      end
    end

    # context 'when user is not logged in' do
    #   before { get :home }

    #   it 'redirects to the login page' do
    #     expect(response).to redirect_to(login_path)
    #   end

    #   it 'does not assign @message' do
    #     expect(assigns(:message)).to be_nil
    #   end
    # end
  end
end
