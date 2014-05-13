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
