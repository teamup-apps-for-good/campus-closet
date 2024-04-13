Feature: Admin User

As an administrator
I want to be able to visit every page,
So that I can inspect the production website for issues.

Background:

    Given the following emails have an account associated with them:
    | email                 |
    | test_donor@gmail.com  |
    | test_student@tamu.edu |
    
    Given the following admin emails exist:
    | email                 |
    | test_admin@gmail.com  |

Scenario: Donor tries to view users page
    Given I am a logged in donor
    And I try to go to the users index page
    Then I should be redirected to the index page
    And I should seen an alert
    And it should say 'You don't have permission to view this page.'

Scenario: Admin tries to view users page
    Given I am a logged in admin
    And I try to go to the users index page
    Then I should still be on the users page
    And I should see a list of users
    And I should see a 'Make Admin' button

Scenario: Student tries to view reviews page
    Given I am a logged in student
    And I try to go to the reviews index page
    Then I should be redirected to the index page
    And I should see an alert
    And it should say 'You don't have permission to view this page.'