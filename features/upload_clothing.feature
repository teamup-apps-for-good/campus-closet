Feature: Upload Clothing

As a clothing donor,
I want to be be able to upload my clothes to campus closet and add tags,
So that I can quickly and easily list clothes for buyers.

Background: clothing in database

  Given the following items exist:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status     | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available  | 
  | red       | pants      | red pants           | Female       | L     | Unused     | Available  |
  | blue      | sweater    | blue sweater        | Male         | S     | Used       | Available  |
  | brown     | belt       | brown belt          | Female       | M     | Unused     | Available  |

Scenario: upload new item with all categories
    Given I am on the items page
    And I am logged in
    And I am on the donor dashboard
    When I click on "Add New Item"
    And I am on the new item page
    And I fill in "color" with "blue"
    And I fill in "type" with "shirt"
    And I fill in description with "blue shirt"
    And I fill in "gender" with "Male"
    And I fill in "size" with "M"
    And I fill in "condition" with "Used"
    And I include a picture
    And I click on "Create Item"
    Then there should be a new item in the items page, 6

Scenario: upload new item with only one category
    Given I am on the items page
    And I am logged in
    And I am on the donor dashboard
    When I click on "Add New Item"
    And I fill in "type" with "pants"
    And I click on "Create Item"
    Then type should still be "pants"

Scenario: upload new item without image
    Given I am on the items page
    And I am logged in
    And I am on the donor dashboard
    When I click on "Add New Item"
    And I fill in "color" with "blue"
    And I fill in "type" with "pants"
    And I fill in description with "blue pants"
    And I fill in "gender" with "Male"
    And I fill in "size" with "M"
    And I fill in "condition" with "Used"
    And I click on "Create Item"
    Then there should be a new item in the items page, 6
    But there should not be a picture




