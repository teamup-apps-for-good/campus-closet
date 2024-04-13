class AddTimeSlotToRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :requests, :time_slot, null: false, foreign_key: true
  end
end