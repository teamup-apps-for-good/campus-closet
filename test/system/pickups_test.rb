# frozen_string_literal: true

require 'application_system_test_case'

class PickupsTest < ApplicationSystemTestCase
  setup do
    @pickup = pickups(:one)
  end

  test 'visiting the index' do
    visit pickups_url
    assert_selector 'h1', text: 'Pickups'
  end

  test 'should create pickup' do
    visit pickups_url
    click_on 'New pickup'

    fill_in 'Donor', with: @pickup.donor_id
    fill_in 'Item', with: @pickup.item_id
    fill_in 'Receiver', with: @pickup.receiver_id
    click_on 'Create Pickup'

    assert_text 'Pickup was successfully created'
    click_on 'Back'
  end

  test 'should update Pickup' do
    visit pickup_url(@pickup)
    click_on 'Edit this pickup', match: :first

    fill_in 'Donor', with: @pickup.donor_id
    fill_in 'Item', with: @pickup.item_id
    fill_in 'Receiver', with: @pickup.receiver_id
    click_on 'Update Pickup'

    assert_text 'Pickup was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Pickup' do
    visit pickup_url(@pickup)
    click_on 'Destroy this pickup', match: :first

    assert_text 'Pickup was successfully destroyed'
  end
end
