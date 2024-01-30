# frozen_string_literal: true

json.extract! user, :id, :first, :last, :email, :phone, :address, :student, :created_at, :updated_at
json.url user_url(user, format: :json)

