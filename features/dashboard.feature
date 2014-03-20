Feature: Dashboard
In order to track all the information about my health in one place
As a health tracker
I want to see a homepage

Background:
  Given I have entered a set of results

Scenario: Homepage navigation
  Given I visit the homepage
  Then I can go to a new blood test form
  And I can go to my existing results

@javascript
Scenario: Graphs
  Given I visit the homepage
  Then I should see a graph

Scenario: JSON data
  Given I visit the JSON page for "hb"
  Then I should see JSON data
