Feature: Allow users to view donor pages to see reviews and items uploaded

As a user
I want to be able to view a donor's page
So that I can see the items they have listed and see review score.

Background: clothing in database

  Given the following emails have a donor account associated with them:
  | email                 |
  | test_donor@gmail.com  |
  | testdonor2@gmail.com  |

  Given the following student account exists:
  | email                   |
  | test_student@gmail.com  |

  Given the following items exist with user_ids:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status       | User    | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Unavailable  |  1      |
  | blue      | pants      | blue pants          | Male         | L     | Used       | Available    |  1      |
  | red       | pants      | red pants           | Male         | L     | Used       | Available    |  2      |

  Given the following pickup exists:
  | Donor | User | Item  |
  | 1     | 2    | 1     |

  Given the following review exists:
  | Donor | User | Pickup | Score |
  | 1     | 3    | 1      | 4     |


Scenario: Viewing Donor Page
    Given I am on the homepage
    When I click on "Test Donor"
    Then I will be on Test Donor donor page
    And I can see "Reviews"
    And I can see "Uploaded Items"
    And I do not see "Account Details"
    And I do not see "Past Pickups"
    And I do not see "Current Requests"

Scenario: Viewing items in Donor Page
    Given I am on the homepage
    When I click on "Test Donor"
    And I should see an item with the description "black shirt"
    And I should see an item with the description "blue pants"
    And I should not see an item with the description "red pants"

Scenario: Viewing review score in Donor Page
    Given I am on the homepage
    When I click on "Test Donor"
    Then I should see "Average Rating: 4.0"

Scenario: No review score exists
    Given I am on the homepage
    When I click on "Test Donor2"
    Then I should see "No reviews yet"

