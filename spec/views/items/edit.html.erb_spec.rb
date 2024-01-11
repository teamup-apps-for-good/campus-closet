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
      condition: nil,
      brand: nil,
      photo_link: nil
    )
  }

  before(:each) do
    assign(:item, item)
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "select[name=?]", "item[color_id]"

      assert_select "select[name=?]", "item[type_id]"

      assert_select "select[name=?]", "item[gender_id]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "select[name=?]", "item[status_id]"

      assert_select "select[name=?]", "item[size_id]"

      assert_select "select[name=?]", "item[condition_id]"
    end
  end
end
