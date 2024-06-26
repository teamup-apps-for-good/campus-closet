# frozen_string_literal: true

RSpec.feature 'Size Selection', type: :feature do
  scenario 'Visiting the sizes page with a type_id parameter' do
    # login as admin to view index page
    User.create(first: 'Test', last: 'Admin', email: 'testadmin@gmail.com', student: false, donor: true, admin: true)
    visit('/')
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(
      :google_oauth2,
      info: { email: 'testadmin@gmail.com' }
    )
    click_on 'Login with Google'

    type = Type.create(name: 'Example Type')
    Size.create(name: 'S', type:)
    Size.create(name: 'M', type:)

    visit sizes_path(type_id: type.id)

    expect(page).to have_content('S')
    expect(page).to have_content('M')
  end
end
