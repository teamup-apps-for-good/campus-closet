Feature: Dashboard and Profile for Donors

As a donor,
I want to be able to manage my listings,
So that I can assess the status of my clothing.

Background: students exist in database
    Given the following emails have an account associated with them:
    | email                 |
    | test_donor@gmail.com  |

Scenario: Logged in donor visits profile page
    Given I am a logged in donor
    When I click on "Dashboard"
    Then I should see "Current Listings"
    And I should see "Past Listings"
    And I should see my account details

Scenario: Donor editing first name
    Given I am a logged in donor
    And I am on the "Dashboard"
    When I click on "edit" next to "first name"
    And I fill in the field with "Jimmy"
    And I press "Submit"
    Then I should see "Jimmy" as my "first name"

Scenario: Donor editing last name
    Given I am a logged in donor
    And I am on the "Dashboard"
    When I click on "edit" next to "last name"
    And I fill in the field with "Jimmy"
    And I press "Submit"
    Then I should see "Jimmy" as my "last name"

Scenario: Donor editing phone
    Given I am a logged in donor
    And I am on the "Dashboard"
    When I click on "edit" next to "phone"
    And I fill in the field with "1234567890"
    And I press "Submit"
    Then I should see "1234567890" as my "phone"

Scenario: Donor editing address
    Given I am a logged in donor
    And I am on the "Dashboard"
    When I click on "edit" next to "address"
    And I fill in the field with "College Station, TX"
    And I press "Submit"
    Then I should see "College Station, TX" as my "address"

Scenario: Donor creating listings
    Given I am a logged in donor
    And I am on the "Dashboard"
    When I click on "Create Listing"
    Then I should go to the "Create Item" page