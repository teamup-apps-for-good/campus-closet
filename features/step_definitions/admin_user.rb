Given('the following admin emails exist:') do |table|
    table.hashes.each do |row|
        email = row['email']
        if email.include?('admin')
            User.create(first: 'Test', last: 'Admin', email:, student: false, donor: true, admin: true)
        else
            User.create(first: 'Test', last: 'User', email:, student: false, donor: true)
        end
    end
end

Given('I try to go to the users index page') do
    visit('/users')
end

Then('I should be redirected to the index page') do
    expect(page).to include('Clothing Type');
end

Then('I should seen an alert') do
    alert = find('.alert-danger')
    expect(page).to include(alert)
end

Then('it should say \'You don\'t have permission to view this page.\'') do
    expect(page).to include('You don\'t have permission to view this page.');
end

Then('I should still be on the users page') do
    expect(page).to include('Users')
end

Then('I should see a list of users') do
    expect(page).to
end

Then('I should see a {string} button') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end

Given('I try to go to the reviews index page') do
    pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see an alert') do
    pending # Write code here that turns the phrase above into concrete actions
end