# frozen_string_literal: true

# spec/mailers/donor_mailer_spec.rb
require 'rails_helper'

RSpec.describe DonorMailer, type: :mailer do
  describe 'confirm_time_to_donor_email' do
    let(:requester) { User.create(first: 'Requester First', last: 'Requester Last', email: 'requester@x.com') }
    let(:donor) { User.create(first: 'Donor First', last: 'Donor Last', email: 'donor@x.com') }
    let(:mail) { described_class.confirm_time_to_donor_email(requester:, donor:) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Confirmed Time from Request')
      expect(mail.to).to eq([donor.email])
      expect(mail.from).to eq(['campus_closet@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Welcome to example.com')
    end
  end
end

# require "test_helper"

# class UserMailerTest < ActionMailer::TestCase
#   let(:user) { User.create(first: 'Requester First', last: "Requester Last", email: "requester@x.com") }
#   let(:donor) { User.create(first: 'Donor First', last: "Donor Last", email: "donor@x.com") }

#   test "invite" do
#     # Create the email and store it for further assertions
#     email = DonorMailer.confirm_time_to_donor_email(user: user, donor: donor)

#     # Send the email, then test that it got queued
#     assert_emails 1 do
#       email.deliver_now
#     end

#     # Test the body of the sent email contains what we expect it to
#     assert_equal ["notifications@campus_closet.com"], email.from
#     assert_equal [:user.email], email.to
#     assert_equal 'Welcome to My Awesome Site', email.subject
#     # assert_equal read_fixture("invite").join, email.body.to_s
#   end
# end
