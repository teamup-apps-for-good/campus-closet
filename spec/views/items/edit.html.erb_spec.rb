require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  let(:item) {
    Item.create!(
      color: nil,
      type: nil,
      gender: nil,
      description: "MyText",
      status: nil,
      size: nil,
      condition: nil
    )
  }

  before(:each) do
    assign(:item, item)
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(item), "post" do

      assert_select "input[name=?]", "item[color_id]"

      assert_select "input[name=?]", "item[type_id]"

      assert_select "input[name=?]", "item[gender_id]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[status_id]"

      assert_select "input[name=?]", "item[size_id]"

      assert_select "input[name=?]", "item[condition_id]"
    end
  end
end
