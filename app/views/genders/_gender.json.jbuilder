# frozen_string_literal: true

json.extract! gender, :id, :name, :created_at, :updated_at
json.url gender_url(gender, format: :json)
