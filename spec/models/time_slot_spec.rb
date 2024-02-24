# frozen_string_literal: true

# spec/models/time_slot_spec.rb

require 'rails_helper'

RSpec.describe TimeSlot, type: :model do
  describe 'associations' do
    it 'belongs to a donor' do
      association = described_class.reflect_on_association(:donor)
      expect(association.macro).to eq :belongs_to
      expect(association.options[:class_name]).to eq 'User'
      expect(association.options[:foreign_key]).to eq 'donor_id'
    end
  end
end
