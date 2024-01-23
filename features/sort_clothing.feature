Feature: Filter Clothing

As a possible receiver of clothes,
I would like to be able to filter clothing,
So I can easily view only the types of clothes I want.

Background: clothing in database

  Given the following items exist:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status       | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available    | 
  | red       | pants      | red pants           | Female       | L     | Unused     | Unavailable  |
  | blue      | sweater    | blue sweater        | Male         | S     | Used       | Available    |
  | brown     | belt       | brown belt          | Female       | M     | Unused     | Unavailable  |

Scenario: filter by condition
  Given I am on the homepage
  When  I press "Used"
  And  I press "Search"
  Then I should see one item with the description "black shirt"
  And I should see one item with the description "blue sweater"

Scenario: filter by color
  Given I am on the homepage
  When I press "black"
  And I press "Search"
  Then I should see one item with the description "black shirt"

Scenario: filter by Gender
  Given I am on the homepage
  When I press "Female"
  And I press "Search"
  Then I should see one item with the description "red pants"
  And I should see one item with the description "brown belt"

Scenario: filter by type
  Given I am on the homepage
  When I press "belt"
  And I press "Search"
  Then I should see one item with the description "brown belt"

Scenario: filter by Size
  Given I am on the homepage
  When I press "M"
  And I press "Search"
  Then I should see one item with the description "black shirt"
  And I should see one item with the description "brown belt"

Scenario: filter by Status
  Given I am on the homepage
  When I press "Available"
  And I press "Search"
  Then I should see one item with the description "black shirt"
  And I should see one item with the description "blue sweater"