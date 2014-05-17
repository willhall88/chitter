Then(/^I should see the users name "(.*?)"$/) do |name|
  page.should have_content name
end

Then(/^I should see the users handle "(.*?)"$/) do |handle|
  page.should have_content handle
end

Given(/^I have a user with the email "(.*?)"$/) do |email|
  User.create(:name => "Will", 
              :username => "willhall88",
              :email => email, 
              :password => "password123", 
              :password_confirmation => "password123")
end

Given(/^I am visiting the registration page$/) do
  visit ('/user/register')
end

Given(/^I have a user with the username "(.*?)"$/) do |username|
    User.create(:name => "Will", 
              :username => username,
              :email => 'an email', 
              :password => "password123", 
              :password_confirmation => "password123")
end

Given(/^I have registered and I am on the homepage$/) do
     User.create(:name => "Will", 
              :username => "willhall88",
              :email => 'willhall88@hotmail.com', 
              :password => "password123", 
              :password_confirmation => "password123")
     visit ('/')
end

When(/^I sign in$/) do
  fill_in('email', :with => 'willhall88@hotmail.com')
  fill_in('password', :with => 'password123')
  click_button('Log in')
end

Given(/^I am logged in and on the homepage$/) do
  User.create(:name => "Will", 
         :username => "willhall88",
         :email => 'willhall88@hotmail.com', 
         :password => "password123", 
         :password_confirmation => "password123")
       visit ('/')
  fill_in('email', :with => 'willhall88@hotmail.com')
  fill_in('password', :with => 'password123')
  click_button('Log in')
end

When(/^I sign out$/) do
  click_button('Sign out')
end



