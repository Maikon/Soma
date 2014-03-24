Given(/^a third party app sends a valid post request$/) do
 
 post create_remote_blood_test_path,
    :blood_test => { taken_on: "2013-03-11",
               hb: 12.7, 
               mcv: 88.0,
               wbc: 7.0, 
               platelets: 278.0, 
               neutrophils: 4.4,
               lymphocytes: 2.0, 
               alt: 12.0, 
               alk_phos: 45,
      creatinine: 50.0, esr: 9.0, crp: ''
             }
end

Then(/^I should see the correct response$/) do
  date = Date.today
  expect(last_response.body).to have_content('"id"')
  expect(last_response.body).to have_content('"created_at":"' + "#{date}")
  expect(last_response.body).to have_content('"taken_on":"2013-03-11",')
  expect(last_response.body).to have_content('"updated_at":"' + "#{date}")
  expect(last_response.body).to have_content('"hb":12.7,"mcv":88.0,"wbc":7.0,')

end

Then(/^I should find the data in the database$/) do
  expect(BloodTest.last.taken_on.to_s).to eq("2013-03-11")
end