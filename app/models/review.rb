# frozen_string_literal: true

# model for review
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :donor, class_name: 'User', foreign_key: 'donor_id'
  belongs_to :pickup

  validates :rating, presence: true
end
