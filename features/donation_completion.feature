Feature: Complete Donation Process

As a donor,
I want to click "confirm" when my item has been donated,
So that the system will know when an item is no longer available.

Background: clothing in database

  Given the following emails have an account associated with them:
  | email                 |
  | test_donor@gmail.com  |
  | test_student@tamu.edu |

  Given the following items exist with user_ids:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     |   User    | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  |    1      |
  | red       | pants      | red pants           | Female       | L     | Unused     | Unvailable |    1      |
  | red       | pants      | red pants           | Female       | L     | Unused     | Unvailable |    2      |

@javascript
Scenario: Donor sees map of requestor after button pressed
    Given I am logged in as a donor
    And there is a request for item 2 uploaded by user 2 from user 2 
    And I am on the donor dashboard
    When I click the Show Map
    Then the map container should be visible

@javascript
Scenario: Donor does not see map of requestor after button pressed
    Given I am logged in as a donor
    And there is a request for item 1 uploaded by user 1 from user 2 
    And I am on the donor dashboard
    When I click the Show Map
    When I click the Show Map
    Then the map container should not be visible

@javascript
Scenario: Finish a request as a donor
    Given I am logged in as a donor
    And there is a request for item 1 uploaded by user 1 from user 2 
    And I am on the donor dashboard
    When I click the current request
    Then I should no longer see a current request
    And a past pickup should be created

@javascript
Scenario: View past pickup as student
    Given I am logged in as a student
    And there is a past pickup for item 2 uploaded by 1 from user 2
    And I am on the student profile page
    Then I should see a past pickup
    And I should no longer see a current request

@javascript
Scenario: Broken request confirmation
    Given I am logged in as a donor
    And there is a request for item 1 uploaded by user 1 from user 3
    And I am on the donor dashboard
    When I click the current request
    And I should no longer see a current request
    And I should see a past pickup

@javascript
Scenario: Student sees map of donor after button pressed
    Given I am logged in as a student
    And there is a request for item 1 uploaded by user 1 from user 2 
    And I am on the student profile page
    When I click the Show Map
    Then the map container should be visible

@javascript
Scenario: Student does not see map of donor after button pressed
    Given I am logged in as a student
    And there is a request for item 1 uploaded by user 1 from user 2 
    And I am on the student profile page
    When I click the Show Map
    Then the map container should not be visible