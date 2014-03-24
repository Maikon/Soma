Feature:  Requests

Scenario: Receiving remote valid post requests
Given a third party app sends a valid post request
Then I should see the correct response
And I should find the data in the database
