# frozen_string_literal: true

json.extract! review, :id, :rating, :user_id, :donor_id, :pickup_id, :created_at, :updated_at
json.url review_url(review, format: :json)
