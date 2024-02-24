Feature: Chat

As a student,
I want to be able to chat with donors,
So I can synchronize a drop-off time with the donor.

Scenario: Accessing chat page as logged in user
    Given I am a logged in donor
    When I visit the chat page
    Then I should see the chat page

Scenario: User sends a message to another user
    Given I am a logged in donor
    And I visit the chat page
    When I fill in the text field with "Test Message"
    And I click on "Send"
    Then I should see the message

Scenario: User tries to access chat without being logged in
    Given I am not logged in
    And I visit the chat page
    Then I cannot access the chat page