# frozen_string_literal: true

# app/models/time_slot.rb
class TimeSlot < ApplicationRecord
  belongs_to :donor, class_name: 'User', foreign_key: 'donor_id'
end
