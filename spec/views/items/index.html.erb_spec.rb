require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        color: nil,
        type: nil,
        gender: nil,
        description: "MyText",
        status: nil,
        size: nil,
        condition: nil,
        brand: nil,
        photo_link: nil
      ),
      Item.create!(
        color: nil,
        type: nil,
        gender: nil,
        description: "MyText",
        status: nil,
        size: nil,
        condition: nil,
        brand: nil,
        photo_link: nil
      )
    ])
  end

  it "renders a list of items" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
