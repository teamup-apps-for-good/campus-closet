Feature: Chatroom

As a student,
I want to be able to chat with donors,
So I can synchronize a drop-off time with the donor.

Background: clothing in database

  Given the following emails have an account associated with them:
  | email                 |
  | test_donor@gmail.com  |
  | teststudent@tamu.edu |

  Given the following items exist with user_ids:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     | User    | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  |  1      |

Scenario: Seeing Chat button only in requests
    Given I am logged in as a donor
    And there is a request for item 1 uploaded by user 1 from user 2
    And I am on the donor dashboard
    Then I should see the chat button

Scenario: User sends a message to another user
    Given I am logged in as a donor
    And request for item 1 uploaded by user 1 from user 2 and chatroom
    And I visit the chat page for item 1
    When I fill in the text field with "Test Message"
    And I click on "Send"
    Then I should see the message

Scenario: User tries to access chat without being logged in
    Given I am not logged in
    When I visit the chat page for item 1
    Then I cannot access the chat page