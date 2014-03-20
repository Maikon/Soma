Feature: Blood Test Reports
  In order to understand my blood test results
  As a health conscious individual with a dislike for tables
  I want to see my results in an ordered manner

  Scenario: Seeing which results are in range and which are out of range
    When I add a new blood test
    Then I should see my results grouped according to whether or not they are in range

  Scenario: Not seeing blank values
    When I enter a set of results that includes an empty value
    Then I should not see the empty result in the report

  Scenario: Viewing reports from the Blood Tests page
    Given I have entered a set of results
    When I am on the blood test results page
    And I click on the date for a blood test
    Then I should be on the report page for that blood test