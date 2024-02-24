# frozen_string_literal: true

# spec/mailers/donor_mailer_spec.rb
require 'rails_helper'

RSpec.describe DonorMailer, type: :mailer do
  describe 'confirm_time_email' do
    let(:user) { User.create(first: 'Example User') }
    let(:mail) { described_class.confirm_time_email(user:).deliver_now }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to My Awesome Site')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['notifications@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Welcome to My Awesome Site')
    end
  end
end
