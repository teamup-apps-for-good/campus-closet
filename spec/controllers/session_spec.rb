# spec/controllers/sessions_controller_spec.rb

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#destroy' do
    it 'clears the session and redirects to root path' do
      user = User.new(
        first: 'John',
        last: 'Doe',
        email: 'john.doe@example.com',
        student: true, # Assuming it's a student
        # Add other attributes as needed
      )

      session[:user_id] = user.id

      delete :destroy

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end
