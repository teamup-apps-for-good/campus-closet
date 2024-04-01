# frozen_string_literal: true

# spec/support/item_creation_helper.rb

module ItemCreationHelper
  def create_item(user)
    user.items.create(
      color: Color.find_or_create_by(name: 'temp_color'),
      type: Type.find_or_create_by(name: 'temp_type'),
      gender: Gender.find_or_create_by(name: 'temp_gender'),
      status: Status.find_or_create_by(name: 'Available'),
      size: Size.find_or_create_by(name: 'temp_size', type_id: Type.first.id),
      condition: Condition.find_or_create_by(name: 'temp_condition')
    )
  end
end
