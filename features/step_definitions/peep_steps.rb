When(/^there is a peep "(.*?)"$/) do |text|
  Peep.create(:peep => text)
end

Then(/^I should see the peep "(.*?)"$/) do |text|
  page.should have_content text
end
