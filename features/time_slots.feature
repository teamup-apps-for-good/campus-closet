Feature: Time Slots

Background:
  Given the following items exist:
    | color | type    | Description   | Gender | Size | Condition | Status    |
    | black | shirt   | black shirt   | Male   | M    | Used      | Available |
    | red   | pants   | red pants     | Female | L    | Unused    | Available |
    | blue  | sweater | blue sweater  | Male   | S    | Used      | Available |
    | brown | belt    | brown belt    | Female | M    | Unused    | Available |

Scenario: User fills out time slot form and submits successfully
  Given I am a logged in donor
  Given I am on the time slot form page
  When I fill in the start time with "2024-02-23T08:00"
  And I click the "Create Time Slots" button

Scenario: User submits form with invalid time slot
  Given I am a logged in donor
  Given I am on the time slot form page
  When I fill in the start time with "2024-02-23T09:00"
  And I click the "Create Time Slots" button

Scenario: Today Button
  Given I am a logged in admin
  Given I am on the time slot index page
  Then I should see today's date on the screen