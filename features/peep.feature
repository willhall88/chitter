Feature: The chitter homepage should display peeps
So that other users can read the peeps

Scenario: Seeing peeps
Given I am on the homepage
When there is a peep
Then I shouldsee the peep