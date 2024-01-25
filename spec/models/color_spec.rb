# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ColorsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      color = Color.create(name: 'Example Color')
      get :show, params: { id: color.to_param }
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
      color = Color.create(name: 'Example Color')
      get :edit, params: { id: color.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Color' do
        expect do
          post :create, params: { color: { name: 'New Color' } }
        end.to change(Color, :count).by(1)
      end

      it 'redirects to the created color' do
        post :create, params: { color: { name: 'New Color' } }
        expect(response).to redirect_to(Color.last)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { color: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      it 'updates the requested color' do
        color = Color.create(name: 'Example Color')
        put :update, params: { id: color.to_param, color: { name: 'Updated Color' } }
        color.reload
        expect(color.name).to eq('Updated Color')
      end

      it 'redirects to the color' do
        color = Color.create(name: 'Example Color')
        put :update, params: { id: color.to_param, color: { name: 'Updated Color' } }
        expect(response).to redirect_to(color)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'edit' template)" do
        color = Color.create(name: 'Example Color')
        put :update, params: { id: color.to_param, color: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested color' do
      color = Color.create(name: 'Example Color')
      expect do
        delete :destroy, params: { id: color.to_param }
      end.to change(Color, :count).by(-1)
    end

    it 'redirects to the colors list' do
      color = Color.create(name: 'Example Color')
      delete :destroy, params: { id: color.to_param }
      expect(response).to redirect_to(colors_url)
    end
  end
end
