# frozen_string_literal: true

RSpec.feature 'Size Selection', type: :feature do
  scenario 'Visiting the sizes page with a type_id parameter' do
    type = Type.create(name: 'Example Type')
    Size.create(name: 'S', type:)
    Size.create(name: 'M', type:)

    visit sizes_path(type_id: type.id)

    expect(page).to have_content('S')
    expect(page).to have_content('M')
  end
end
