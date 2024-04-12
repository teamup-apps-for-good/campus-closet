Feature: Filter Clothing

As a possible receiver of clothes,
I would like to be able to filter clothing,
So I can easily view only the types of clothes I want.

Background: clothing in database

  Given the following items exist:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  | 
  | red       | pants      | red pants           | Female       | L     | Unused     | Available  |
  | blue      | sweater    | blue sweater        | Male         | S     | Used       | Available  |
  | brown     | belt       | brown belt          | Female       | M     | Unused     | Available  |
  | black     | belt       | black belt          | Female       | M     | Unused     | Available  |

Scenario: filter by condition
  Given I am on the homepage
  When I select "Used" from "condition"
  And I click on "Filter"
  Then I should see an item with the description "black shirt"
  And I should see an item with the description "blue sweater"

Scenario: filter by color
  Given I am on the homepage
  When I select "black" from "color"
  And I click on "Filter"
  Then I should see an item with the description "black shirt"

Scenario: filter by Gender
  Given I am on the homepage
  When I select "Female" from "gender"
  And I click on "Filter"
  Then I should see an item with the description "red pants"
  And I should see an item with the description "brown belt"

Scenario: filter by size on By type
  Given I am on the homepage
  When I click on "View shirt"
  And I select "M" from "size"
  And I click on "Filter"
  Then I should see an item with the description "black shirt"
  And I should not see an item with the description "brown belt"

Scenario: filter by color on By type
  Given I am on the homepage
  When I click on "View shirt"
  And I select "black" from "color"
  And I click on "Filter"
  Then I should see an item with the description "black shirt"
  And I should not see an item with the description "black belt"

Scenario: filter by gender on By type
  Given I am on the homepage
  When I click on "View shirt"
  And I select "Male" from "gender"
  And I click on "Filter"
  Then I should see an item with the description "black shirt"
  And I should not see an item with the description "blue sweater"