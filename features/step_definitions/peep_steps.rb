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