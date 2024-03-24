Feature: Submit clothing request and notify donor

As a clothing recipient
I want to rate donors
So that I can let other users know who is generous or perhaps misleading.

Background: clothing in database

  Given the following emails have an account associated with them:
  | email                 |
  | test_donor@gmail.com  |
  | teststudent@tamu.edu |

  Given the following items exist with user_ids:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     | User    | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  |  1      |

  Given the following pickup exists:
  | Donor | User | Item  |
  | 1     | 2    | 1     |

Scenario: Get to review page
    Given I am a logged in student
    And I am on the Profile Page
    And a past pickup exists
    When I click on "Review Donor"
    Then I should be on the review page

Scenario: Leave a review for the donor
    Given I am a logged in student
    And I am on the Profile Page
    And a past pickup exists
    When I click on "Review Donor"
    And I fill in rating with "1"
    And I click on "Create Review"
    Then I should go back to the Profile Page
    And I should see a "1" for the review

Scenario: Blank review
    Given I am a logged in student
    And I am on the Profile Page
    And a past pickup exists
    When I click on "Review Donor"
    And I click on "Create Review"
    Then I should see "Rating can't be blank"
    And I should still be on the review page
