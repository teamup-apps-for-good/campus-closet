# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConditionsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      condition = Condition.create(name: 'Example Condition')
      get :show, params: { id: condition.to_param }
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
      condition = Condition.create(name: 'Example Condition')
      get :edit, params: { id: condition.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Condition' do
        expect do
          post :create, params: { condition: { name: 'New Condition' } }
        end.to change(Condition, :count).by(1)
      end

      it 'redirects to the created condition' do
        post :create, params: { condition: { name: 'New Condition' } }
        expect(response).to redirect_to(Condition.last)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { condition: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      it 'updates the requested condition' do
        condition = Condition.create(name: 'Example Condition')
        put :update, params: { id: condition.to_param, condition: { name: 'Updated Condition' } }
        condition.reload
        expect(condition.name).to eq('Updated Condition')
      end

      it 'redirects to the condition' do
        condition = Condition.create(name: 'Example Condition')
        put :update, params: { id: condition.to_param, condition: { name: 'Updated Condition' } }
        expect(response).to redirect_to(condition)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'edit' template)" do
        condition = Condition.create(name: 'Example Condition')
        put :update, params: { id: condition.to_param, condition: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested condition' do
      condition = Condition.create(name: 'Example Condition')
      expect do
        delete :destroy, params: { id: condition.to_param }
      end.to change(Condition, :count).by(-1)
    end

    it 'redirects to the conditions list' do
      condition = Condition.create(name: 'Example Condition')
      delete :destroy, params: { id: condition.to_param }
      expect(response).to redirect_to(conditions_url)
    end
  end
  describe 'POST #create' do
    context 'with invalid parameters' do
      it 'renders the new template with unprocessable_entity status (HTML)' do
        post :create, params: { condition: { name: nil } }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders a JSON response with unprocessable_entity status (JSON)' do
        post :create, params: { condition: { name: nil } }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    let(:condition) { Condition.create(name: 'Initial Condition') }

    context 'with invalid parameters' do
      it 'renders the edit template with unprocessable_entity status (HTML)' do
        patch :update, params: { id: condition.id, condition: { name: nil } }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders a JSON response with unprocessable_entity status (JSON)' do
        patch :update, params: { id: condition.id, condition: { name: nil } }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
