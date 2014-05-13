Feature: The chitter site should allow users to sign up
So that the users can post peeps

Scenario: Registering a user
  Given I am on the homepage
  When I press "Register"
  And I fill in "name" with "Will"
  And I fill in "username" with "willhall88"
  And I fill in "email" with "willhall88@hotmail.com"
  And I fill in "password" with "lemon"
  And I fill in "password_confirmation" with "lemon"
  And I press "Register"
  Then I should view "Welcome, Will"

Scenario: Email address cannot be used for two users
  Given I have a user with the email "willhall88@hotmail.com"
  And I am visiting the registration page
  And I fill in "name" with "Will"
  And I fill in "username" with "willhall88"
  And I fill in "email" with "willhall88@hotmail.com"
  And I fill in "password" with "lemon"
  And I fill in "password_confirmation" with "lemon"
  And I press "Register"
  Then I should see "This email is already registered"

Scenario: Email address cannot be used for two users
  Given I have a user with the username "willhall88"
  And I am visiting the registration page
  And I fill in "name" with "Will"
  And I fill in "username" with "willhall88"
  And I fill in "email" with "willhall88@hotmail.com"
  And I fill in "password" with "lemon"
  And I fill in "password_confirmation" with "lemon"
  And I press "Register"
  Then I should see "This username is already taken"