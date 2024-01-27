# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe '#process_params_with_prefix' do
    let(:dummy_class) do
      Class.new do
        def self.find(id)
          { id:, name: "Item #{id}" }
        end
      end
    end

    it 'returns a list of items based on the given prefix' do
      params = { 'item_1' => '1', 'item_2' => '2', 'item_3' => '3' }
      prefix = 'item_'

      items_list = controller.send(:process_params_with_prefix, params, prefix, dummy_class)

      expect(items_list).to be_an(Array)
      expect(items_list.length).to eq(3)
    end

    it 'returns an empty list for params without the specified prefix' do
      params = { 'other_key' => 'other_value', 'another_key' => 'yet_another_value' }
      prefix = 'item_'

      items_list = controller.send(:process_params_with_prefix, params, prefix, dummy_class)

      expect(items_list).to be_an(Array)
      expect(items_list).to be_empty
    end
  end
end
