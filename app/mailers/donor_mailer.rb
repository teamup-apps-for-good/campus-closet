# frozen_string_literal: true

# mailer for the donor
class DonorMailer < ApplicationMailer
  # default from: 'campus_closet@gmail.com'

  def confirm_time_to_donor_email(requester = User.first, donor = User.last)
    @requester = requester
    @donor = donor
    mail(
      from: 'campus_closet@gmail.com',
      to: donor.email,
      subject: 'Confirmed Time from Request'
    )
  end
end
