Given(/^I am on the blood test entry page$/) do
  visit new_blood_test_path
end

When(/^I enter the results$/) do
  fill_in 'blood_test[taken_on]', with: '01/01/2014'
  fill_in 'Hb', with: '13'
  fill_in 'MCV', with: '88'
  fill_in 'WBC', with: '7.0'
  fill_in 'Platelets', with: '278'
  fill_in 'Neutrophils', with: '4.4'
  fill_in 'Lymphocytes', with: '2.2'
  fill_in 'ALT', with: '12'
  fill_in 'Alk phos', with: '67'
  fill_in 'Creatinine', with: '50'
  fill_in 'ESR', with: '9'
  fill_in 'CRP', with: '<5'
  click_button 'submit'
end

Then(/^I want to be able to see those results$/) do
  ['date', '01/01/2014', 'Hb', '13', 'MCV', '88', 'WBC', '7.0', 'Platelets', '278', 'Neutrophils', '4.4', 'Lymphocytes', '2.2', 'ALT', '12', 'Alk phos', '67', 'Creatinine', '50', 'ESR', '9', 'CRP', '<5'].each do |string|
    expect(page).to have_content(string)
  end
end
