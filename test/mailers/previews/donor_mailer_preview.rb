# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/donor_mailer
class DonorMailerPreview < ActionMailer::Preview
  def confirm_time_to_donor_email
    DonorMailer.with(requester: User.last, donor: User.first).confirm_time_to_donor_email
  end
end
