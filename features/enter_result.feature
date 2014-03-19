Feature: Entering Results
  In order to track my health
  As a health aware person
  I want to enter my latest blood results

Scenario: For the first time
  Given I am on the blood test entry page
  When I enter the results
  Then I want to be able to see those results

Scenario: With the same date
  Given I am on the blood test entry page
  When I enter two sets of results with the same date
  Then I should be on the blood test entry page
  And I should see "You already gave me test results for this day"

Scenario: With nil values
  When I enter a set of result that includes an empty value
  Then there should be blank cells in the table

Scenario: With empty date
  Given I am on the blood test entry page
  When I don't enter a date
  Then I should be on the blood test entry page
  And I should see "Date can't be blank"
