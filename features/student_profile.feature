Feature: Profile Page for Students

As a student,
I would like to be able to view and edit my profile page
including location, name, etc. and view my orders
So I can book and view my orders

Background: students exist in database
    Given the following emails have an account associated with them:
    | email                 |
    | test_student@tamu.edu |

Scenario: Logged in student visits profile page
    Given I am a logged in student
    When I click on "Profile Page"
    Then I should see "Current Requests"
    And I should see "Past Pickups"
    And I should see my account details

Scenario: Student editing address
    Given I am a logged in student
    And I am on the "Profile Page"
    When I click on "edit" next to "address"
    And I fill in the field with "College Station, TX"
    And I press "Submit"
    Then I should see "College Station, TX" as my "address"

Scenario: Student editing phone
    Given I am a logged in student
    And I am on the "Profile Page"
    When I click on "edit" next to "phone"
    And I fill in the field with "1234567890"
    And I press "Submit"
    Then I should see "1234567890" as my "phone"
  
