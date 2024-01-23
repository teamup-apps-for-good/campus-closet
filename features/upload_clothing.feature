Feature: Upload Clothing

As a clothing donor,
I want to be be able to upload my clothes to campus closet and add tags,
So that I can quickly and easily list clothes for buyers.

Background: clothing in database

  Given the following items exist:
  | color     | type       | Description         | Gender       | Size  | Condition  | Status       | 
  | black     | shirt      | black shirt         | Male         | M     | Used       | Available    | 
  | red       | pants      | red pants           | Female       | L     | Unused     | Unavailable  |
  | blue      | sweater    | blue sweater        | Male         | S     | Used       | Available    |
  | brown     | belt       | brown belt          | Female       | M     | Unused     | Unavailable  |

Scenario: upload new item with all categories
    Given I am on the items page
    And I click on "New Item"
    And I fill in the fields with  "black", "shirt", "black shirt", "Male", "M", "Used", "Available"
    And I include a picture
    And I click on "Create Item"
    Then there should be a new item in the items page
    And there should be an image

Scenario: upload new item with only one category
    Given I am on the items page
    And I click on "New Item"
    And I fill in "Type" with "Pants"
    And I click on "Create Item"
    Then I should still be on the New Item page

Scenario: upload new item without image
  Given I am on the items page
  And I click on "New Item"
  And I fill in the fields with  "black", "shirt", "black shirt", "Male", "M", "Used", "Available"
  And I click on "Create Item"
  Then there should be a new item in the items page
  But there should not be a picture




