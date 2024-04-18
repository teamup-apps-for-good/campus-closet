# frozen_string_literal: true

# spec/controllers/time_slots_controller_spec.rb

require 'rails_helper'

RSpec.describe TimeSlotsController, type: :controller do
  before do
    allow(controller).to receive(:require_admin)
  end
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
  end

  describe 'PUT #mark_unavailable' do
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

    context 'when the time slot is successfully marked as unavailable' do
      before do
        put :mark_unavailable, params: { id: time_slot.id }
        time_slot.reload
      end

      it 'returns a success message' do
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Time slot marked as unavailable.')
      end

      it 'marks the time slot as unavailable' do
        expect(time_slot.status).to eq('unavailable')
      end
    end

    context 'when the time slot cannot be marked as unavailable' do
      before do
        allow_any_instance_of(TimeSlot).to receive(:update).and_return(false)
        put :mark_unavailable, params: { id: time_slot.id }
      end

      it 'returns an error message' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to eq('Failed to mark time slot as unavailable. Please try again.')
      end
    end
  end
  describe '#build_time_slot' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(
      :google_oauth2,
      info: { email: 'testdonor@tamu.edu', name: 'Test Donor' }
    )

    user = User.from_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
    it 'builds a new time slot for the current user with status "available"' do
      time_slot_param = { start_time: Time.now, end_time: Time.now + 1.hour }
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      time_slot = controller.send(:build_time_slot, time_slot_param)

      expect(time_slot.status).to eq('available')
    end
  end
end
