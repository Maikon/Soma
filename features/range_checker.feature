Feature: Checking Range
  In order to get feedback on my state of health
  As a health aware person
  I want to see if my blood tests are within normal range

  Scenario: Highlight out of range results
    Given I am on the blood test entry page
    When I enter the results
    Then I want to see which tests are out of range

  Scenario: Highlight results within range
    Given I am on the blood test entry page
    When I enter the results
    Then I want to see which tests are within range
