# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, user: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create(first: 'Example User')
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      user = User.create(first: 'Example User')
      get :edit, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: { first: 'New User' } }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the created user' do
        post :create, params: { user: { first: 'New User' } }
        expect(response).to redirect_to(User.last)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { user: { first: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      it 'updates the requested user' do
        user = User.create(first: 'Example User')
        put :update, params: { id: user.to_param, user: { first: 'Updated User' } }
        user.reload
        expect(user.first).to eq('Updated User')
      end

      it 'redirects to the user' do
        user = User.create(first: 'Example User')
        put :update, params: { id: user.to_param, user: { first: 'Updated User' } }
        expect(response).to redirect_to(user)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'edit' template)" do
        user = User.create(first: 'Example User')
        put :update, params: { id: user.to_param, user: { first: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create(first: 'Example User')
      expect do
        delete :destroy, params: { id: user.to_param }
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      user = User.create(first: 'Example User')
      delete :destroy, params: { id: user.to_param }
      expect(response).to redirect_to(users_url)
    end
  end
end
