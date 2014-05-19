Feature: The chitter homepage should display peeps
So that other users can read the peeps

Scenario: Seeing peeps
  Given there is a peep "this is a peep"
  When I am on the homepage
  Then I should see the peep "this is a peep"

Scenario: a peep belongs to a user
  Given there is a user with a peep "This is a peep"
  When I am on the homepage
  Then I should see the peep "This is a peep"
  And I should see the users name "Will"
  And I should see the users handle "@will" 

Scenario: A user can post a new peep
  Given a user is logged in
  When they post a new peep
  Then I should see the peep