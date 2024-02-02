Feature: Display Homepage

As a student,
I want to be able to see useful articles of clothing and navbar,
So that people in need of this attire can receive it.

Background: clothing in database

  Given the following items exist:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  | 
  | red       | pants      | red pants           | Female       | L     | Unused     | Available  |
  | blue      | sweater    | blue sweater        | Male         | S     | Used       | Available  |
  | brown     | belt       | brown belt          | Female       | M     | Unused     | Available  |

Scenario: show all the items 
    Given I am on the homepage
    Then I should see 4 items

Scenario: show items and they are different
    Given I am on the homepage
    Then I should see an item with the description "black shirt"
    And I should see an item with the description "red pants"
    And I should see an item with the description "blue sweater"
    And I should see an item with the description "brown belt"

Scenario: show item details
    Given I am on the homepage
    And I should see an item with the description "red pants"
    And I click on "Show this item" for "red pants"
    Then I should be on an item description for "red pants"
    And the type should be "pants"

    