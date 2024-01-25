# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GendersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      gender = Gender.create(name: 'Example Gender')
      get :show, params: { id: gender.to_param }
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
      gender = Gender.create(name: 'Example Gender')
      get :edit, params: { id: gender.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Gender' do
        expect do
          post :create, params: { gender: { name: 'New Gender' } }
        end.to change(Gender, :count).by(1)
      end

      it 'redirects to the created gender' do
        post :create, params: { gender: { name: 'New Gender' } }
        expect(response).to redirect_to(Gender.last)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { gender: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      it 'updates the requested gender' do
        gender = Gender.create(name: 'Example Gender')
        put :update, params: { id: gender.to_param, gender: { name: 'Updated Gender' } }
        gender.reload
        expect(gender.name).to eq('Updated Gender')
      end

      it 'redirects to the gender' do
        gender = Gender.create(name: 'Example Gender')
        put :update, params: { id: gender.to_param, gender: { name: 'Updated Gender' } }
        expect(response).to redirect_to(gender)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'edit' template)" do
        gender = Gender.create(name: 'Example Gender')
        put :update, params: { id: gender.to_param, gender: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested gender' do
      gender = Gender.create(name: 'Example Gender')
      expect do
        delete :destroy, params: { id: gender.to_param }
      end.to change(Gender, :count).by(-1)
    end

    it 'redirects to the genders list' do
      gender = Gender.create(name: 'Example Gender')
      delete :destroy, params: { id: gender.to_param }
      expect(response).to redirect_to(genders_url)
    end
  end
end
