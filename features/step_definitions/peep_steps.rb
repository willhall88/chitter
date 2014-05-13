When(/^there is a peep "(.*?)"$/) do |text|
  user = User.create(:name => "Will", :username => "will")
  Peep.create(:peep => text, :user_id => user.id )
end

Then(/^I should see the peep "(.*?)"$/) do |text|
  page.should have_content text
end

Given(/^there is a user with a peep "(.*?)"$/) do |text|
  user = User.create(:name => "Will", :username => "will")
  Peep.create(:peep => text, :user_id => user.id ) 
end

Then(/^I should see the users name "(.*?)"$/) do |name|
  page.should have_content name
end

Then(/^I should see the users handle "(.*?)"$/) do |handle|
  page.should have_content handle
end

Then(/^I should view "(.*?)"$/) do |name|
  page.should have_content name
end