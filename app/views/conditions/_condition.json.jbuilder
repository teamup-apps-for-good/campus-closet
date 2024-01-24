# frozen_string_literal: true

json.extract! condition, :id, :name, :created_at, :updated_at
json.url condition_url(condition, format: :json)
