As a clothing donor,
I want to be be able to upload my clothes to campus closet and add tags,
So that I can quickly and easily list clothes for buyers.

Background: clothing in database

  Given the following items exist:
  | name       | color     | type       | Description   | Gender  | Size  | Condition  | Status       | 
  | t-shirt-5  | black     | t-shirt    | t-shirt       | M       | M     | Used       | Available    |
  | pants-1    | red       | pants      | pants         | F       | L     | Unused     | Unavailable  |
  | sweater-7  | blue      | sweater    | sweater       | M       | S     | Used       | Available    |
  | belt-2     | brown     | belt       | belt          | F       | M     | Unused     | Unavailable  |

Scenario: upload new item with all categories
    Given I am on the items page
    And I click on New Item
    And I fill in Color with Black
    And I fill in Type with Pants
    And I fill in Gender with Male
    And I fill in Description with nothing
    And I fill in Status with Available
    And I fill in Size with M
    And I fill in Condition with Used
    And I hit Create Item
    Then there should be a new item in the items page

Scenario: upload new item with only one category
    Given I am on the items page
    And I click on New Item
    And I fill in Type with Pants
    And I hit Create Item
    Then there should be a new item in the items page
    And it should have Type Pants
    But Color should not be Red




