# frozen_string_literal: true

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
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(
        :google_oauth2,
        info: { email: 'testdonor@tamu.edu', name: 'Test Donor' }
      )

      user = User.from_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
      time_slot = TimeSlot.create(
        donor: user,
        start_time: DateTime.now.beginning_of_hour + 1.day,
        end_time: DateTime.now.beginning_of_hour + 25.hours,
        status: 'available'
      )
      get :show, params: { id: time_slot.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(
        :google_oauth2,
        info: { email: 'testdonor@tamu.edu', name: 'Test Donor' }
      )

      user = User.from_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
      time_slot = TimeSlot.create(
        donor: user,
        start_time: DateTime.now.beginning_of_hour + 1.day,
        end_time: DateTime.now.beginning_of_hour + 25.hours,
        status: 'available'
      )
      get :edit, params: { id: time_slot.id }
      expect(response).to be_successful
    end
  end

  describe 'DELETE #destroy' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(
      :google_oauth2,
      info: { email: 'testdonor@tamu.edu', name: 'Test Donor' }
    )

    user = User.from_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
    time_slot = TimeSlot.create(
      donor: user,
      start_time: DateTime.now.beginning_of_hour + 1.day,
      end_time: DateTime.now.beginning_of_hour + 25.hours,
      status: 'available'
    )

    it 'destroys the time slot' do
      expect do
        delete :destroy, params: { id: time_slot.id }
      end.to change(TimeSlot, :count).by(-1)
    end

    it 'redirects to the time slots list' do
      delete :destroy, params: { id: time_slot.id }
      expect(response).to redirect_to(time_slots_url)
      expect(flash[:notice]).to eq('Time slot was successfully destroyed.')
    end
  end

  describe 'PATCH/PUT #update' do
    let(:user) do
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(
        :google_oauth2,
        info: { email: 'testdonor@tamu.edu', name: 'Test Donor' }
      )
      donor_user = User.from_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
      session[:user_id] = donor_user.id
      donor_user
    end

    let(:time_slot) do
      TimeSlot.create(
        donor: user,
        start_time: DateTime.now.beginning_of_hour + 1.day,
        end_time: DateTime.now.beginning_of_hour + 25.hours,
        status: 'available'
      )
    end

    context 'with invalid parameters' do
      it 'does not update the time slot' do
        invalid_params = { start_time: nil, end_time: nil }
        patch :update, params: { id: time_slot.id, time_slot: invalid_params }
        time_slot.reload
        expect(time_slot.start_time).not_to eq(nil)
        expect(time_slot.end_time).not_to eq(nil)
      end

      it 'renders the edit template' do
        invalid_params = { start_time: nil, end_time: nil }
        patch :update, params: { id: time_slot.id, time_slot: invalid_params }
      end
    end
  end

  describe 'POST #create' do
    let(:invalid_params) do
      {
        time_slots: [
          { start_time: nil, end_time: nil },
          { start_time: Time.now, end_time: nil }
        ]
      }
    end

    it 'does not create new time slots' do
      expect do
        post :create, params: invalid_params
      end.not_to change(TimeSlot, :count)
    end

    it 'redirects to new time slot path' do
      post :create, params: invalid_params
    end
  end
end
