# frozen_string_literal: true

json.extract! pickup, :id, :donor_id, :receiver_id, :item_id, :created_at, :updated_at
json.url pickup_url(pickup, format: :json)
