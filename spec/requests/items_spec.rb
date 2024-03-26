# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/items', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Item. As you add validations to Item, be sure to
  # adjust the attributes here as well.
  # let(:color) { FactoryGirl.create(:color) }
  # let(:type) { FactoryGirl.create(:type) }
  # let(:gender) { FactoryGirl.create(:anaesthetist)}
  # let(:status) { FactoryGirl.create(:hospital) }
  # let(:size) { FactoryGirl.create(:hospital) }
  # let(:condition) { FactoryGirl.create(:condition) }
  let(:user) { User.create(first: 'Example User', donor: true) }
  let(:valid_attributes) do
    { color: Color.create(name: 'temp_color'), type: Type.create(name: 'temp_type'),
      gender: Gender.create(name: 'temp_gender'), status: Status.create(name: 'temp_status'),
      size: Size.create(name: 'temp_size', type_id: Type.first.id),
      condition: Condition.create(name: 'temp_condition') }
    # skip("Add a hash of attributes valid for your model")
    #   # {"color" => Color.find(1).id, "type" => 1, "gender" => 1, "status" => 1, "size" => 1, "condition" => 1}
    #   # FactoryBot.attributes_for(:item)
  end

  let(:invalid_attributes) do
    { color: 'green', type: 'bad',
      gender: 'none', status: 'not sure',
      size: 'extra small', condition: 'awful' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      user.items.create(color: Color.create(name: 'temp_color'), type: Type.create(name: 'temp_type'),
                        gender: Gender.create(name: 'temp_gender'), status: Status.create(name: 'temp_status'),
                        size: Size.create(name: 'temp_size', type_id: Type.first.id),
                        condition: Condition.create(name: 'temp_condition'))
      get items_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      item = user.items.create(color: Color.create(name: 'temp_color'), type: Type.create(name: 'temp_type'),
                               gender: Gender.create(name: 'temp_gender'), status: Status.create(name: 'temp_status'),
                               size: Size.create(name: 'temp_size', type_id: Type.first.id),
                               condition: Condition.create(name: 'temp_cond'))
      get item_url(item)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_item_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      item = user.items.create(color: Color.create(name: 'temp_color'), type: Type.create(name: 'temp_type'),
                               gender: Gender.create(name: 'temp_gender'), status: Status.create(name: 'temp_status'),
                               size: Size.create(name: 'temp_size', type_id: Type.first.id),
                               condition: Condition.create(name: 'temp_cond'))
      get edit_item_url(item)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested item' do
        item = user.items.create! valid_attributes
        new_color = Color.create(name: 'new_color')

        # Set the color_id directly in the new_attributes
        new_attributes = { color_id: new_color.id }

        patch item_url(item), params: { item: new_attributes }
        item.reload

        # Ensure the color_id is updated
        expect(item.color_id).to eq(new_color.id)
      end

      it 'redirects to the item' do
        item = user.items.create! valid_attributes
        new_color = Color.create(name: 'new_color')
        new_attributes = { color_id: new_color.id }

        patch item_url(item), params: { item: new_attributes }
        item.reload

        expect(response).to redirect_to(item_url(item))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        { color_id: 5 }
      end

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        item = user.items.create! valid_attributes
        patch item_url(item), params: { item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested item' do
      item = user.items.create! valid_attributes
      expect do
        delete item_url(item)
      end.to change(Item, :count).by(-1)
    end

    it 'redirects to the items list' do
      item = user.items.create! valid_attributes
      delete item_url(item)
      expect(response).to redirect_to(items_url)
    end
  end
end
