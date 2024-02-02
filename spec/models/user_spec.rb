# frozen_string_literal: true

# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.from_omniauth' do
    it 'creates a user from OmniAuth data' do
      # Create a mock OmniAuth response for a user
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(
        :google_oauth2,
        info: { email: 'testdonor@gmail.com', name: 'Test Donor' }
      )

      # Call the User.from_omniauth method
      auth_data = OmniAuth.config.mock_auth[:google_oauth2]
      user = User.from_omniauth(auth_data)

      # Expectations
      expect(user).to be_a(User)
      expect(user.email).to eq('testdonor@gmail.com')
      expect(user.first).to eq('Test')
      expect(user.last).to eq('Donor')
      expect(user.student).to be(false)
    end

    it 'sets student attribute to true for tamu.edu email' do
      # Create a mock OmniAuth response with a tamu.edu email
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(
        :google_oauth2,
        info: { email: 'testuser@tamu.edu', name: 'Test TAMU User' }
      )

      # Call the User.from_omniauth method
      auth_data = OmniAuth.config.mock_auth[:google_oauth2]
      user = User.from_omniauth(auth_data)

      # Expectations
      expect(user.student).to be(true)
    end

    it 'sets student attribute to false for non-tamu.edu email' do
      # Create a mock OmniAuth response with a non-tamu.edu email
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(
        :google_oauth2,
        info: { email: 'testuser@example.com', name: 'Test User' }
      )

      # Call the User.from_omniauth method
      auth_data = OmniAuth.config.mock_auth[:google_oauth2]
      user = User.from_omniauth(auth_data)

      # Expectations
      expect(user.student).to be(false)
    end
  end
end
