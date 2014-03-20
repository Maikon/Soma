Feature: Blood Test Reports
  In order to understand my blood test results
  As a health conscious individual with a dislike for tables
  I want to see my results in an ordered manner

  Scenario: Seeing which results are in range and which are out of range
    When I add a new blood test
    Then I should see my results grouped according to whether or not they are in range