# frozen_string_literal: true

json.array! @pickups, partial: 'pickups/pickup', as: :pickup
