Feature: Account Creation

As a user,
I want to be able to view details about an item,
So that I can understand what clothes I want.

Background:

    Given the following emails have an account associated with them:
    | email                 |
    | test_donor@gmail.com  |
    | test_student@tamu.edu |

Scenario: User logs in with TAMU email for first time
    Given I am a user with a TAMU email
    And I do not have an account already
    And I am on the Login page
    When I click "Login with Google"
    Then I should be logged in successfully
    And I should be put on the account creation page

Scenario: User logs in with TAMU email
    Given I am a user with a TAMU email
    And I have an account
    And I am on the Login page
    When I click "Login with Google"
    Then I should be logged in successfully
    And I should be put on the account creation page

Scenario: User logs in with gmail for first time
    Given I am a user with a gmail
    And I do not have an account already
    And I am on the Login page
    When I click "Login with Google"
    Then I should be logged in successfully
    And I should be put on the account creation page

Scenario: User logs in with gmail
    Given I am a user with a gmail
    And I have an account
    And I am on the Login page
    When I click "Login with Google"
    Then I should be logged in successfully
    And I should be put on the homepage
