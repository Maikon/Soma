Feature: Editing a blood test
  In order to correct my mistakes
  As a slightly careless health conscious person
  I want to be able to edit a previously entered blood test

  Scenario: From the blood tests page
    Given I have entered a set of results
    When I click "Edit"
    And fill up the edit form
    Then I am on the blood test results page
    And I should see my changes