# frozen_string_literal: true

require 'test_helper'

# test/controllers/time_slots_controller_test.rb
class TimeSlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_slot = time_slots(:one)
  end

  test 'should get index' do
    get time_slots_url
    assert_response :success
  end

  test 'should get new' do
    get new_time_slot_url
    assert_response :success
  end

  test 'should create time_slot' do
    assert_difference('TimeSlot.count') do
      post time_slots_url,
           params: { time_slot: { donor_id: @time_slot.donor_id, end_time: @time_slot.end_time,
                                  start_time: @time_slot.start_time, status: @time_slot.status } }
    end

    assert_redirected_to time_slot_url(TimeSlot.last)
  end

  test 'should show time_slot' do
    get time_slot_url(@time_slot)
    assert_response :success
  end

  test 'should get edit' do
    get edit_time_slot_url(@time_slot)
    assert_response :success
  end

  test 'should update time_slot' do
    patch time_slot_url(@time_slot),
          params: { time_slot: { donor_id: @time_slot.donor_id, end_time: @time_slot.end_time,
                                 start_time: @time_slot.start_time, status: @time_slot.status } }
    assert_redirected_to time_slot_url(@time_slot)
  end

  test 'should destroy time_slot' do
    assert_difference('TimeSlot.count', -1) do
      delete time_slot_url(@time_slot)
    end

    assert_redirected_to time_slots_url
  end
end
