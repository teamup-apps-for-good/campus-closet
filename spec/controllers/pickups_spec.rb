# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PickupsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create(first: 'Example User')
      user1 = User.create(first: 'Example User1')
      item = Item.create(color: Color.create(name: 'temp_color'), type: Type.create(name: 'temp_type'),
                         gender: Gender.create(name: 'temp_gender'), status: Status.create(name: 'temp_status'),
                         size: Size.create(name: 'temp_size'), condition: Condition.create(name: 'temp_condition'))
      pickup = Pickup.create(donor_id: user.id, receiver_id: user1.id, item_id: item.id)
      get :show, params: { id: pickup.to_param }
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
      pickup = Pickup.create(donor_id: 1, receiver_id: 2, item_id: 3)
      get :edit, params: { id: pickup.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Pickup' do
        expect do
          post :create, params: { pickup: { donor_id: 1, receiver_id: 2, item_id: 3 } }
        end.to change(Pickup, :count).by(1)
      end

      it 'redirects to the created pickup' do
        post :create, params: { pickup: { donor_id: 1, receiver_id: 2, item_id: 3 } }
        expect(response).to redirect_to(Pickup.last)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { pickup: { donor_id: nil, receiver_id: 2, item_id: 3 } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'PATCH/PUT #update' do
    let(:pickup) { Pickup.create(donor_id: 1, receiver_id: 2, item_id: 3) }

    context 'with valid parameters' do
      it 'updates the requested pickup' do
        put :update, params: { id: pickup.to_param, pickup: { donor_id: 4, receiver_id: 5, item_id: 6 } }
        pickup.reload
        expect([pickup.donor_id, pickup.receiver_id, pickup.item_id]).to eq([4, 5, 6])
      end

      it 'redirects to the pickup' do
        put :update, params: { id: pickup.to_param, pickup: { donor_id: 4, receiver_id: 5, item_id: 6 } }
        expect(response).to redirect_to(pickup)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'edit' template)" do
        put :update, params: { id: pickup.to_param, pickup: { donor_id: nil, receiver_id: 5, item_id: 6 } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested pickup' do
      pickup = Pickup.create(donor_id: 1, receiver_id: 2, item_id: 3)
      expect do
        delete :destroy, params: { id: pickup.to_param }
      end.to change(Pickup, :count).by(-1)
    end

    it 'redirects to the pickups list' do
      pickup = Pickup.create(donor_id: 1, receiver_id: 2, item_id: 3)
      delete :destroy, params: { id: pickup.to_param }
      expect(response).to redirect_to(pickups_url)
    end
  end
end
