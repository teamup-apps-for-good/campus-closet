# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, user: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response for logged-in donor user' do
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(
        :google_oauth2,
        info: { email: 'testdonor@tamu.edu', name: 'Test Donor' }
      )

      user = User.from_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
      session[:user_id] = user.id

      get :show, params: { id: user.id }

      expect(response).to be_successful
    end

    it 'redirects to root_path for unauthorized user' do
      user = User.create(first: 'Example User')
      get :show_donor, params: { id: user.to_param }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("You don't have permission to view this profile.")
    end
  end

  it 'returns a success response for logged-in student user' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(
      :google_oauth2,
      info: { email: 'teststudent@tamu.edu', name: 'Test Student' }
    )

    # Log in the student user by creating a session
    student_user = User.from_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
    student_user.student = true
    student_user.save
    session[:user_id] = student_user.id

    get :show, params: { id: student_user.id }

    expect(response).to be_successful
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response for logged-in user' do
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(
        :google_oauth2,
        info: { email: 'testdonor@tamu.edu', name: 'Test Donor' }
      )

      # Log in the user by creating a session
      user = User.from_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
      session[:user_id] = user.id

      get :edit, params: { id: user.id }

      expect(response).to be_successful
    end

    it 'redirects to root_path for unauthorized user' do
      user = User.create(first: 'Example User')
      get :edit, params: { id: user.to_param }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("You don't have permission to view this profile.")
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: { first: 'New User', email: 'test@tamu.edu' } }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the created user' do
        post :create, params: { user: { first: 'New User' } }
        expect(response).to redirect_to(User.last)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { user: { first: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create(first: 'Example User')
      expect do
        delete :destroy, params: { id: user.to_param }
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      user = User.create(first: 'Example User')
      delete :destroy, params: { id: user.to_param }
      expect(response).to redirect_to(users_url)
    end
  end
end
