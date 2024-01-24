# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TypesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      type = Type.create(name: 'Example Type')
      get :show, params: { id: type.to_param }
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
      type = Type.create(name: 'Example Type')
      get :edit, params: { id: type.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Type' do
        expect do
          post :create, params: { type: { name: 'New Type' } }
        end.to change(Type, :count).by(1)
      end

      it 'redirects to the created type' do
        post :create, params: { type: { name: 'New Type' } }
        expect(response).to redirect_to(Type.last)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { type: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      it 'updates the requested type' do
        type = Type.create(name: 'Example Type')
        put :update, params: { id: type.to_param, type: { name: 'Updated Type' } }
        type.reload
        expect(type.name).to eq('Updated Type')
      end

      it 'redirects to the type' do
        type = Type.create(name: 'Example Type')
        put :update, params: { id: type.to_param, type: { name: 'Updated Type' } }
        expect(response).to redirect_to(type)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'edit' template)" do
        type = Type.create(name: 'Example Type')
        put :update, params: { id: type.to_param, type: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested type' do
      type = Type.create(name: 'Example Type')
      expect do
        delete :destroy, params: { id: type.to_param }
      end.to change(Type, :count).by(-1)
    end

    it 'redirects to the types list' do
      type = Type.create(name: 'Example Type')
      delete :destroy, params: { id: type.to_param }
      expect(response).to redirect_to(types_url)
    end
  end
end
