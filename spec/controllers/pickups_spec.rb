# frozen_string_literal: true

require 'rails_helper'

shared_examples 'another CRUD controller' do |model_class, _controller_class|
  let(:user) { User.create(first: 'Example User', donor: true) }
  let(:user1) { User.create(first: 'Example User1', donor: true) }
  let(:user2) { User.create(first: 'Example User2') }
  let(:user3) { User.create(first: 'Example User3') }
  let(:item) { create_item(user) }
  let(:item1) do
    user1.items.create(color: Color.create(name: 'color1'), type: Type.create(name: 'type1'),
                       gender: Gender.create(name: 'gender1'), status: Status.create(name: 'status1'),
                       size: Size.create(name: 'size1', type_id: Type.first.id),
                       condition: Condition.create(name: 'condition1'))
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      instance = model_class.create(donor_id: user.id, receiver_id: user1.id, item_id: item.id)
      get :show, params: { id: instance.to_param }
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
      instance = model_class.create(donor_id: user.id, receiver_id: user1.id, item_id: item.id)
      get :edit, params: { id: instance.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it "creates a new #{model_class}" do
        expect do
          post :create,
               params: { "#{model_class.to_s.underscore}": { donor_id: user.id, receiver_id: user1.id,
                                                             item_id: item.id } }
        end.to change(model_class, :count).by(1)
      end

      it "redirects to the created #{model_class}" do
        post :create,
             params: { "#{model_class.to_s.underscore}": { donor_id: user.id, receiver_id: user1.id,
                                                           item_id: item.id } }
        expect(response).to redirect_to(model_class.last)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create,
             params: { "#{model_class.to_s.underscore}": { donor_id: user.id, receiver_id: user1.id,
                                                           item_id: item.id } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'PATCH/PUT #update' do
    let(:instance) { model_class.create(donor_id: user.id, receiver_id: user1.id, item_id: item.id) }

    context 'with valid parameters' do
      it "updates the requested #{model_class}" do
        put :update,
            params: { id: instance.id,
                      "#{model_class.to_s.underscore}": { donor_id: user2.id, receiver_id: user3.id,
                                                          item_id: item1.id } }

        instance.reload
        expect([instance.donor_id, instance.receiver_id, instance.item_id]).to eq([user2.id, user3.id, item1.id])
      end

      it "redirects to the #{model_class}" do
        put :update,
            params: { id: instance.id,
                      "#{model_class.to_s.underscore}": { donor_id: user2.id, receiver_id: user3.id,
                                                          item_id: item1.id } }
        expect(response).to redirect_to(instance)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'edit' template)" do
        put :update,
            params: { id: instance.id,
                      "#{model_class.to_s.underscore}": { donor_id: nil, receiver_id: user3.id, item_id: item1.id } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it "destroys the requested #{model_class}" do
      instance = model_class.create(donor_id: user.id, receiver_id: user1.id, item_id: item.id)
      expect do
        delete :destroy, params: { id: instance.to_param }
      end.to change(model_class, :count).by(-1)
    end

    it "redirects to the #{model_class.to_s.pluralize} list" do
      instance = model_class.create(donor_id: user.id, receiver_id: user1.id, item_id: item.id)
      delete :destroy, params: { id: instance.to_param }
      expect(response).to redirect_to(send("#{model_class.to_s.underscore.pluralize}_url"))
    end
  end
end

RSpec.describe PickupsController, type: :controller do
  it_behaves_like 'another CRUD controller', Pickup, PickupsController
end
