# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'items/new', type: :view do
  before(:each) do
    assign(:item, Item.new(
                    color: nil,
                    type: nil,
                    gender: nil,
                    description: 'MyText',
                    status: nil,
                    size: nil,
                    condition: nil,
                    brand: nil,
                    photo_link: nil
                  ))
  end

  it 'renders new item form' do
    render

    assert_select 'form[action=?][method=?]', items_path, 'post' do
      assert_select 'select[name=?]', 'item[color_id]'

      assert_select 'select[name=?]', 'item[type_id]'

      assert_select 'select[name=?]', 'item[gender_id]'

      assert_select 'textarea[name=?]', 'item[description]'

      assert_select 'select[name=?]', 'item[status_id]'

      assert_select 'select[name=?]', 'item[size_id]'

      assert_select 'select[name=?]', 'item[condition_id]'

      assert_select 'input[type=file][name=?]', 'item[photo_link]'
    end
  end
end
