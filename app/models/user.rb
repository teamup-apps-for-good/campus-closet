# frozen_string_literal: true

# Model for the users
class User < ApplicationRecord
  has_many :donated_pickups, class_name: 'Pickup', foreign_key: 'donor_id'
  has_many :received_pickups, class_name: 'Pickup', foreign_key: 'receiver_id'
  has_many :donated_requests, class_name: 'Request', foreign_key: 'donor_id'
  has_many :received_requests, class_name: 'Request', foreign_key: 'receiver_id'
  has_many :time_slots, class_name: 'TimeSlot', foreign_key: 'donor_id'
  has_many :items

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_initialize
    names = auth['info']['name'].split

    # Update the user's attributes
    user.update(
      email: auth.info.email,
      first: names[0],
      last: names[1..].join(' ')
    )

    # Save the user
    user.save

    user
  end
end
