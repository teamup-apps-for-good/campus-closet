# frozen_string_literal: true

json.extract! time_slot, :id, :donor_id, :start_time, :end_time, :status, :created_at, :updated_at
json.url time_slot_url(time_slot, format: :json)
