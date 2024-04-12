# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { User.create(first: 'Example User', donor: true, admin: true) }
  before do
    @item_with_user = user.items.create(color: Color.create(name: 'temp_color'), type: Type.create(name: 'temp_type'),
                                        gender: Gender.create(name: 'temp_gender'),
                                        status: Status.create(name: 'temp_status'),
                                        size: Size.create(name: 'temp_size', type_id: Type.first.id),
                                        condition: Condition.create(name: 'temp_cond'))
  end
  describe '#process_params_with_prefix' do
    let(:dummy_class) do
      Class.new do
        def self.find(id)
          { id:, name: "Item #{id}" }
        end
      end
    end
  end

  describe '#mark_unavailable' do
    let(:item) { create_item(user) }
    let(:status) { Status.create(name: 'Unavailable') }

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
      allow(invalid_item).to receive(:id).and_return(1)
      allow(invalid_item).to receive(:status=)

      Status.find_by(name: 'Unavailable')

      put :mark_unavailable, params: { id: invalid_item.id }, format: :json

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({ 'some' => 'error' })
    end
  end

  describe '#authorize_item_edit' do
    let(:basic_user) { User.create(first: 'Example User', donor: true, admin: false) }
    context 'when user is not authorized' do
      it 'sets flash alert and redirects' do
        allow(controller).to receive(:current_user).and_return(basic_user)
        allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development'))

        get :edit, params: { id: @item_with_user.id }
        assert_redirected_to items_path # Assert redirection
        assert_equal 'You are not authorized to edit this item.', flash[:alert]
      end
    end
  end
end
