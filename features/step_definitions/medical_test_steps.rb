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

Then(/^I want to be able to see those results$/) do
  ['Taken on', '2014-01-01', 'Hb', '13', 'MCV', '88', 'WBC', '7.0', 'Platelets', '278', 'Neutrophils', '4.4', 'Lymphocytes', '2.2', 'ALT', '103', 'Alk Phos', '67', 'Creatinine', '50', 'ESR', '9', 'CRP', '<5'].each do |string|
    expect(page).to have_content(string)
  end
end

Then(/^I want to see which tests are out of range$/) do
  expect(page).to have_css('.danger', text: '103')
end
