Feature: Submit clothing request and notify donor

As a user,
I want to pick a time from the donor's available timeslots
So that they know when I am also available to pickup clothes

Background: clothing in database

  Given the following items exist:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  | 
  | red       | pants      | red pants           | Female       | L     | Unused     | Available  |
  | blue      | sweater    | blue sweater        | Male         | S     | Used       | Available  |
  | brown     | belt       | brown belt          | Female       | M     | Unused     | Available  |

    Given the following emails have an account associated with them:
    | email                 |
    | test_donor@gmail.com  |
    | test_student@tamu.edu |

Scenario: Select a time to pickup item as a student
    Given I have a student account, "test_student@tamu.edu"
    And I am on the items page
    When I click "Show this item"
    Then I should see the item details  
    When I click "select item"
    Then I should see the donors availability
    When I click a time slot
    Then I should be sent back to the items page
    And the donor should be notified

Scenario: Request gets submitted
    Given I have a student account, "test_student@tamu.edu"
    And I am on the items page
    When I click "Show this item"
    Then I should see the item details  
    When I click "select item"
    And I complete select a time to pickup 
    Then a request should be successfully submitted
    And the database should be updated appropriately

Scenario: Donor goes to dashboard after a student requests item
    Given I have a donor account, "test_donor@gmail.com"
    And I have an item(s) listed to be donated
    And a student requests an item
    And I go to my profile page
    Then I should see that item has been requested