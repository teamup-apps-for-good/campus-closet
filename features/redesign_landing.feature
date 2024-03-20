Feature: Redesign landing page to have user select clothing type

As a clothing recipient
I want to start searching by clothing type
So that I can access type-specific filters in the proceeding page.

Background: clothing in database

  Given the following items exist:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  | 
  | red       | pants      | red pants           | Female       | L     | Unused     | Available  |
  | blue      | sweater    | blue sweater        | Male         | S     | Used       | Available  |
  | brown     | belt       | brown belt          | Female       | M     | Unused     | Available  |

Scenario: Sort shirts
  Given I am on the homepage
  When I click on "View shirt"
  Then I should see an item with the description "black shirt"
  And I should not see an item with the description "red pants"
  And I should not see an item with the description "blue sweater"
  And I should not see an item with the description "brown belt"

Scenario: Sort pants
  Given I am on the homepage
  When I click on "View pants"
  Then I should see an item with the description "red pants"
  And I should not see an item with the description "black shirt"
  And I should not see an item with the description "blue sweater"
  And I should not see an item with the description "brown belt"

Scenario: Sort sweaters
  Given I am on the homepage
  When I click on "View sweater"
  Then I should see an item with the description "blue sweater"
  And I should not see an item with the description "red pants"
  And I should not see an item with the description "black shirt"
  And I should not see an item with the description "brown belt"

Scenario: Sort belts
  Given I am on the homepage
  When I click on "View belt"
  Then I should see an item with the description "brown belt"
  And I should not see an item with the description "red pants"
  And I should not see an item with the description "blue sweater"
  And I should not see an item with the description "black shirt"

