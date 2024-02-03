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
    Then I should see "Requests"
    And I should see "Pickups"
    And I should see my account details

Scenario: Donor editing first name
    Given I am a logged in donor
    And I am on the Dashboard
    When I click on "Edit Account"
    And I fill in the "First" field with "Jimmy"
    And I click on "Confirm User Updates"
    Then I should see "Jimmy" as my "First"

Scenario: Donor editing last name
    Given I am a logged in donor
    And I am on the Dashboard
    When I click on "Edit Account"
    And I fill in the "Last" field with "Jimmy"
    And I click on "Confirm User Updates"
    Then I should see "Jimmy" as my "Last"

Scenario: Donor editing phone
    Given I am a logged in donor
    And I am on the Dashboard
    When I click on "Edit Account"
    And I fill in the "Phone" field with "1234567890"
    And I click on "Confirm User Updates"
    Then I should see "1234567890" as my "Phone"

Scenario: Donor editing address
    Given I am a logged in donor
    And I am on the Dashboard
    When I click on "Edit Account"
    And I fill in the "Address" field with "College Station, TX"
    And I click on "Confirm User Updates"
    Then I should see "College Station, TX" as my "Address"
