# frozen_string_literal: true

json.extract! request, :id, :donor_id, :receiver_id, :item_id, :created_at, :updated_at
json.url request_url(request, format: :json)
