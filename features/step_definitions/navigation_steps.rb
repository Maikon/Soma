Given(/^I visit the homepage$/) do
  visit root_path
end

Given(/^I visit the JSON page for "(.*?)"$/) do |link|
  visit "/blood-tests/results/#{link}"
end

Then(/^I should see JSON data$/) do
  expect(page).to have_content("date")
  expect(page).to have_content("2014-01-01")
  expect(page).to have_content("result")
  expect(page).to have_content("13")
end

Then(/^I can go to a new blood test form$/) do
  click_link "Enter new blood test results"
  expect(current_path).to eq(new_blood_test_path)
end

Then(/^I can go to my existing results$/) do
  click_link "See blood test results table"
  expect(current_path).to eq(blood_tests_path)
end

Then(/^I should see a graph$/) do
  expect(page).to have_css('svg')
end

Then(/^I should only see the hb graph$/) do
  expect(page).to have_css('svg.hb', visible: true)
end

Then(/^when I click on alt$/) do
  click_link 'alt'
end

Then(/^I should only see the graph for alt$/) do
  expect(page).to have_css('svg.hb', visible: false)
end
