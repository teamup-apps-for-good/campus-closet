Feature: Update the donor and student view pages

As a user,
I want my current requests to show the time slot,
So that I can see the time we need to meet.

Background: clothing in database

  Given the following emails have an account associated with them:
  | email                 |
  | testdonor@gmail.com   |
  | teststudent@tamu.edu  |

  Given the following items exist with user_ids:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     | User    | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  |  1      |

  Given the following time slot exists:
  | Donor |
  | 1     | 

  Given the following request exists:
  | Donor | User | Item  | Time |
  | 1     | 2    | 1     | 1    |


Scenario: Student see time slot in request
    Given I am a logged in student
    And I am on the Profile Page
    Then I should see "Start: "

Scenario: Donor see time slot in request
    Given I am a logged in donor
    And I am on the Dashboard
    Then I should see "Start: "

Scenario: Donor sees time slot in Account details
    Given I am a logged in donor
    And I am on the Dashboard
    Then I should see "Available Time Slots"