When(/^there is a peep "(.*?)"$/) do |text|
  user = User.create(:name => "Will", 
                        :email => "willhall88@hotmail.com",
                        :username => "willhall88", 
                        :password => "password123",  
                        :password_confirmation => "password123")
  Peep.create(:peep => text, :user_id => user.id )
end

Then(/^I should see the peep "(.*?)"$/) do |text|
  page.should have_content text
end

Given(/^there is a user with a peep "(.*?)"$/) do |text|
  user = User.create(:name => "Will", 
                        :email => "willhall88@hotmail.com",
                        :username => "willhall88", 
                        :password => "password123",  
                        :password_confirmation => "password123")
  Peep.create(:peep => text, :user_id => user.id ) 
end



Then(/^I should view "(.*?)"$/) do |name|
  page.should have_content name
end

Given(/^a user is logged in$/) do
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

When(/^they post a new peep$/) do
  fill_in('new_peep', :with => 'this is a new peep')
  click_button('New Peep')
    fill_in('new_peep', :with => 'this is a 2nd new peep')
  click_button('New Peep')
end

Then(/^I should see the peep$/) do
  page.should have_content ('this is a new peep')
  page.should have_content ('this is a 2nd new peep')
end