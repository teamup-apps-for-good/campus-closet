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

  describe '#mark_unavailable' do
  let(:user) { User.create(first: 'Example User', donor: true) }
  let(:item) do
    user.items.create(
      color: Color.create(name: 'temp_color'),
      type: Type.create(name: 'temp_type'),
      gender: Gender.create(name: 'temp_gender'),
      status: Status.create(name: 'Available'),
      size: Size.create(name: 'temp_size'),
      condition: Condition.create(name: 'temp_condition')
    )
  end
  let(:status) {Status.create(name: 'Unavailable')}

    it 'marks the item as unavailable' do
      put :mark_unavailable, params: { id: item.id }, format: :json

      expect(response).to have_http_status(:ok)
      expect(item.reload.status.name).to eq('Unavailable')
    end

    it 'creates a new status if "Unavailable" status does not exist' do
      Status.find_by(name: 'Unavailable')&.destroy

      put :mark_unavailable, params: { id: item.id }, format: :json

      expect(response).to have_http_status(:ok)
      expect(item.reload.status.name).to eq('Unavailable')
    end

    it 'renders unprocessable_entity if item save fails' do
      invalid_item = instance_double(Item, save: false, errors: { some: 'error' })
      allow(Item).to receive(:find).and_return(invalid_item)
      allow(invalid_item).to receive(:id).and_return(1) # Define the id method
      allow(invalid_item).to receive(:status=) # Define the status= method

      # Find the actual Status object (assuming you have a way to access it)
      unavailable_status = Status.find_by(name: 'Unavailable')

      put :mark_unavailable, params: { id: invalid_item.id }, format: :json

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({ "some" => "error" })
    end
  end
end
