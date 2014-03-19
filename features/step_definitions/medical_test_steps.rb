Given(/^I am on the blood test entry page$/) do
  visit new_blood_test_path
end

When(/^I enter the results$/) do
  fill_in 'blood_test[taken_on]', with: '01/01/2014'
  fill_in 'blood_test[hb]', with: '13'
  fill_in 'blood_test[mcv]', with: '88'
  fill_in 'blood_test[wbc]', with: '7.0'
  fill_in 'blood_test[platelets]', with: '278'
  fill_in 'blood_test[neutrophils]', with: '4.4'
  fill_in 'blood_test[lymphocytes]', with: '2.2'
  fill_in 'blood_test[alt]', with: '103'
  fill_in 'blood_test[alk_phos]', with: '67'
  fill_in 'blood_test[creatinine]', with: '50'
  fill_in 'blood_test[esr]', with: '9'
  fill_in 'blood_test[crp]', with: '<5'
  click_button 'submit'
end

When(/^I enter a set of result that includes an empty value$/) do
  visit new_blood_test_path
  fill_in 'blood_test[taken_on]', with: '01/01/2014'
  fill_in 'blood_test[hb]', with: '13'
  fill_in 'blood_test[mcv]', with: '88'
  fill_in 'blood_test[wbc]', with: '7.0'
  fill_in 'blood_test[platelets]', with: '278'
  fill_in 'blood_test[neutrophils]', with: '4.4'
  fill_in 'blood_test[lymphocytes]', with: '2.2'
  fill_in 'blood_test[alt]', with: '103'
  fill_in 'blood_test[alk_phos]', with: ''
  fill_in 'blood_test[creatinine]', with: '50'
  fill_in 'blood_test[esr]', with: '9'
  fill_in 'blood_test[crp]', with: '<5'
  click_button 'submit'
end

Then(/^I want to be able to see those results$/) do
  ['Taken on', '01 Jan 2014', 'Hb', '13', 'MCV', '88', 'WBC', '7.0', 'Platelets', '278', 'Neutrophils', '4.4', 'Lymphocytes', '2.2', 'ALT', '103', 'Alk Phos', '67', 'Creatinine', '50', 'ESR', '9', 'CRP', '<5'].each do |string|
    expect(page).to have_content(string)
  end
end

Then(/^I want to see which tests are out of range$/) do
  expect(page).to have_css('.danger', text: '103')
end

Then(/^I want to see which tests are within range$/) do
  expect(page).to have_css('.no-danger', text: '13')
end

Given(/^I have submitted more than one set of results$/) do
  enter_blood('01/01/2013')
  enter_blood('01/01/2012')
  enter_blood('01/01/2014')
end

When(/^I am on the blood test results page$/) do
  visit blood_tests_path
end

Then(/^I should see those results in chronological order$/) do
  first = page.all(:xpath, '//tr/td').first
  last = page.all(:xpath, '//tr').last
  expect(first).to have_content('01 Jan 2014')
  expect(last).to have_content('01 Jan 2012')
end

When(/^I enter two sets of results with the same date$/) do
  enter_blood('01/01/2014')
  enter_blood('01/01/2014')
end

When(/^I don't enter a date$/) do
  enter_blood('')
end

Then(/^I should be on the blood test entry page$/) do
  expect(current_path).to eq(new_blood_test_path)
end

Then(/^there should be blank cells in the table$/) do
  expect(page).to have_css('.empty-value', text: '')
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

def enter_blood(date)
  visit new_blood_test_path
  fill_in 'blood_test[taken_on]', with: date
  fill_in 'blood_test[hb]', with: '13'
  fill_in 'blood_test[mcv]', with: '88'
  fill_in 'blood_test[wbc]', with: '7.0'
  fill_in 'blood_test[platelets]', with: '278'
  fill_in 'blood_test[neutrophils]', with: '4.4'
  fill_in 'blood_test[lymphocytes]', with: '2.2'
  fill_in 'blood_test[alt]', with: '103'
  fill_in 'blood_test[alk_phos]', with: '67'
  fill_in 'blood_test[creatinine]', with: '50'
  fill_in 'blood_test[esr]', with: '9'
  fill_in 'blood_test[crp]', with: '<5'
  click_button 'submit'
end
