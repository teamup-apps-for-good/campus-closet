# frozen_string_literal: true

Given('the following time slot exists:') do |table|
  table.hashes.each do |row|
    donor = row['Donor']
    TimeSlot.create(
      donor_id: donor,
      start_time: DateTime.now.beginning_of_hour + 1.day,
      end_time: DateTime.now.beginning_of_hour + 25.hours,
      status: 'available'
    )
    TimeSlot.create(
      donor_id: donor,
      start_time: DateTime.now.beginning_of_hour + 2.day,
      end_time: DateTime.now.beginning_of_hour + 49.hours,
      status: 'available'
    )
  end
end

Given('the following request exists:') do |table|
  table.hashes.each do |row|
    Request.create(donor_id: row['Donor'], receiver_id: row['User'], item_id: row['Item'],
                   time_slot_id: row['Time'])
  end
end
