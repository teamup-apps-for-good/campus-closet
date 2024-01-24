# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'items/show', type: :view do
  before(:each) do
    assign(:item, Item.create!(
                    color: nil,
                    type: nil,
                    gender: nil,
                    description: 'MyText',
                    status: nil,
                    size: nil,
                    condition: nil
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
