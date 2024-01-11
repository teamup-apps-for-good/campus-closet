As a student,
I want to be able to see useful articles of clothing and navbar,
So that people in need of this attire can receive it.

Background: clothing in database

  Given the following items exist:
  | name       | color     | type       | Description   | Gender  | Size  | Condition  | Status       | 
  | t-shirt-5  | black     | t-shirt    | t-shirt       | M       | M     | Used       | Available    |
  | pants-1    | red       | pants      | pants         | F       | L     | Unused     | Unavailable  |
  | sweater-7  | blue      | sweater    | sweater       | M       | S     | Used       | Available    |
  | belt-2     | brown     | belt       | belt          | F       | M     | Unused     | Unavailable  |

Scenario: show all the items based on count
    Given I am on the homepage
    And I am on the items page
    Then I should see 4 items

Scenario: show items and they are different
    Given I am on the homepage
    Then I should see a t-shirt
    And I should see a pants
    And I should see a sweater
    And I should see a belt

Scenario: show item details
    Given I am on the homepage
    And I see a t-shirt
    And I click on "Show this item" for Pants
    Then I should be on an item description
    And the Type should be Pants
    