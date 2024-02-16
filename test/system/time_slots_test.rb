# frozen_string_literal: true

require 'application_system_test_case'

class TimeSlotsTest < ApplicationSystemTestCase
  setup do
    @time_slot = time_slots(:one)
  end

  test 'visiting the index' do
    visit time_slots_url
    assert_selector 'h1', text: 'Time slots'
  end

  test 'should create time slot' do
    visit time_slots_url
    click_on 'New time slot'

    fill_in 'Donor', with: @time_slot.donor_id
    fill_in 'End time', with: @time_slot.end_time
    fill_in 'Start time', with: @time_slot.start_time
    fill_in 'Status', with: @time_slot.status
    click_on 'Create Time slot'

    assert_text 'Time slot was successfully created'
    click_on 'Back'
  end

  test 'should update Time slot' do
    visit time_slot_url(@time_slot)
    click_on 'Edit this time slot', match: :first

    fill_in 'Donor', with: @time_slot.donor_id
    fill_in 'End time', with: @time_slot.end_time
    fill_in 'Start time', with: @time_slot.start_time
    fill_in 'Status', with: @time_slot.status
    click_on 'Update Time slot'

    assert_text 'Time slot was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Time slot' do
    visit time_slot_url(@time_slot)
    click_on 'Destroy this time slot', match: :first

    assert_text 'Time slot was successfully destroyed'
  end
end
