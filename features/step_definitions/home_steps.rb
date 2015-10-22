When(/^I visit the home page$/) do
  HomePage.new.visit_page
end

Then(/^I see the title (.*)$/) do | title |
  expect(HomePage.new.title).to eq(title)
end