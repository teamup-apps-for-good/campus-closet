require "application_system_test_case"

class ConditionsTest < ApplicationSystemTestCase
  setup do
    @condition = conditions(:one)
  end

  test "visiting the index" do
    visit conditions_url
    assert_selector "h1", text: "Conditions"
  end

  test "should create condition" do
    visit conditions_url
    click_on "New condition"

    fill_in "Name", with: @condition.name
    click_on "Create Condition"

    assert_text "Condition was successfully created"
    click_on "Back"
  end

  test "should update Condition" do
    visit condition_url(@condition)
    click_on "Edit this condition", match: :first

    fill_in "Name", with: @condition.name
    click_on "Update Condition"

    assert_text "Condition was successfully updated"
    click_on "Back"
  end

  test "should destroy Condition" do
    visit condition_url(@condition)
    click_on "Destroy this condition", match: :first

    assert_text "Condition was successfully destroyed"
  end
end
