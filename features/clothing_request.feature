Feature: Submit clothing request and notify donor

As a user,
I want to pick a time from the donor's available timeslots
So that they know when I am also available to pickup clothes

Background: clothing in database

  Given the following items exist with user_ids:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     | User    | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  |  1      |
  | red       | pants      | red pants           | Female       | L     | Unused     | Available  |  1      |
  | blue      | sweater    | blue sweater        | Male         | S     | Used       | Available  |  1      |
  | brown     | belt       | brown belt          | Female       | M     | Unused     | Available  |  1      |

  Given the following emails have an account associated with them:
  | email                 |
  | test_donor@gmail.com  |
  | test_student@tamu.edu |

Scenario: Select a time to pickup item as a student
    Given I have a student account, "test_student@tamu.edu"
    And I am on the items page
    And there is a time slot from "2024-02-22 21:00:00" to "2024-02-22 21:30:00" for user with id 1
    When I click on a link with href "/items/1" and text "Show this item"
    Then I should see the item details  
    Then I should see the donors availability
    When I click a time slot from "9:00 PM" to "9:30 PM"
    Then I should be sent back to the items page
    And the donor should be notified

Scenario: Request gets submitted
    Given I have a student account, "test_student@tamu.edu"
    And I am on the items page
    And there is a time slot from "2024-02-22 21:00:00" to "2024-02-22 21:30:00" for user with id 1
    When I click on a link with href "/items/1" and text "Show this item"
    Then I should see the item details  
    And I click a time slot from "9:00 PM" to "9:30 PM"
    Then a request should be successfully submitted
    And the database should be updated appropriately

Scenario: Donor goes to dashboard after a student requests item
    Given I have a donor account, "test_donor@gmail.com"
    And I have an item(s) listed to be donated
    And a student requests an item
    And I go to my profile page
    Then I should see that item has been requested