# frozen_string_literal: true

# Model for the users
class User < ApplicationRecord
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
