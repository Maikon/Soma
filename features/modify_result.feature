Feature: Editing a blood test
  In order to correct my mistakes
  As a slightly careless health conscious person
  I want to be able to edit a previously entered blood test

  Scenario: From the blood tests page
    Given I have entered a set of results
    When I click "Edit"
    Then I should be on the edit page for that blood test