require "application_system_test_case"

class GendersTest < ApplicationSystemTestCase
  setup do
    @gender = genders(:one)
  end

  test "visiting the index" do
    visit genders_url
    assert_selector "h1", text: "Genders"
  end

  test "should create gender" do
    visit genders_url
    click_on "New gender"

    fill_in "Name", with: @gender.name
    click_on "Create Gender"

    assert_text "Gender was successfully created"
    click_on "Back"
  end

  test "should update Gender" do
    visit gender_url(@gender)
    click_on "Edit this gender", match: :first

    fill_in "Name", with: @gender.name
    click_on "Update Gender"

    assert_text "Gender was successfully updated"
    click_on "Back"
  end

  test "should destroy Gender" do
    visit gender_url(@gender)
    click_on "Destroy this gender", match: :first

    assert_text "Gender was successfully destroyed"
  end
end
