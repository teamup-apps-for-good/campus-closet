Feature: sort and filter clothing

As a possible receiver of clothes,
I would like to be able to sort and filter clothing,
So I can easily view only the types of clothes I want.

Background: clothing in database

  Given the following items exist:
  | name        | condition | color     | type         |
  | t-shirt-5   | Good      | White     | shirt        |
  | sweater-1   | Great     | Gray      | sweater      |
  | shorts-2    | Poor      | Green     | short-pants  |
  | hat-0       | Poor      | Pink      | accessory    |

Scenario: filter by condition
  Given I am to the homepage
  When  I press "shirts"
  And  I press "filter by condition" and "Poor"
  Then I should see "shorts-2" and "hat-0"