Given(/^I visit the site for the first time$/) do
  visit root_path
end

Then(/^I can go to a new blood test form$/) do
  click_link "Enter new blood test results"
  expect(current_path).to eq(new_blood_test_path)
end

Then(/^I can go to my existing results$/) do
  click_link "See blood test results table"
  expect(current_path).to eq(blood_tests_path)
end