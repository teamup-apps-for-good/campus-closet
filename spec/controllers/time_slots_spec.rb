    # spec/controllers/time_slots_controller_spec.rb

    require 'rails_helper'

RSpec.describe TimeSlotsController, type: :controller do
    describe 'GET #index' do
        it 'returns a success response' do
            get :index
            expect(response).to be_successful
        end
    end

    describe 'GET #new' do
        it 'returns a success response' do
            get :new
            expect(response).to be_successful
        end
    end

    describe 'GET #show' do
    it 'returns a success response' do
      post = Post.create! valid_attributes
      get :show, params: { id: post.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      post = Post.create! valid_attributes
      get :edit, params: { id: post.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end
end
