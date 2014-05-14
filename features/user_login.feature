Feature: The chitter site should allow users to Login
So that the users can post peeps

Scenario: Logging in
  Given I have registered and I am on the homepage
  When I sign in
  Then I should see "Welcome, Will"
