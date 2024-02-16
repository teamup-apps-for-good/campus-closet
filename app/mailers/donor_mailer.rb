# frozen_string_literal: true

# mailer for the donor
class DonorMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirm_time_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
