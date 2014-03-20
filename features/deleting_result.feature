Feature: Deleting a blood test
  In order to fix my graph when I enter wrong test results
  I want to be able to delete existing blood tests that are wrong

  Scenario: From the blood tests edit page
    Given I have entered a set of results
    When I click "Edit"
    And I delete the given test
    Then I should not see that set of data on the page
