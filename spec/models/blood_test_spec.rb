require 'spec_helper'

describe BloodTest do
  let(:test) do
    BloodTest.new(test_data)
  end

  let(:test_with_crp) do
    BloodTest.new(test_data('<3'))
  end

  let(:test_with_crp_as_fixnum) do
    BloodTest.new(test_data(7))
  end

  it 'should be able to return nicely formatted messages' do
    expect(test).to receive(:errors).and_return(key: 'error')
    expect(test.error_messages).to eq(['error'])
  end

  context 'Must return JSON data for' do
    it 'Hb' do
      expect(BloodTest).to receive(:order).and_return([test])
      expect(BloodTest.as_json(:hb)).to eq("[{\"date\":\"2013-03-11\",\"result\":12.7}]")
    end

    it 'should not return data for empty result' do
      expect(BloodTest).to receive(:order).and_return([test, test_with_crp])
      expect(BloodTest.as_json(:crp)).to eq("[{\"date\":\"2013-03-11\",\"result\":3}]")
    end

    it 'CRP even if the result is a fixnum' do
      expect(BloodTest).to receive(:order).and_return([test_with_crp_as_fixnum])
      expect(BloodTest.as_json(:crp)).to eq("[{\"date\":\"2013-03-11\",\"result\":7}]")
    end

    it 'the legend' do
      expect(BloodTest.legend_as_json).to eq({:hb=>{:name=>"Hb", :fullname=>"Haemoglobin", :unit=>"g/L", :min=>11.5, :max=>16}, :mcv=>{:name=>"MCV", :fullname=>"Mean Cell Volume", :unit=>"fL", :min=>80, :max=>100}, :wbc=>{:name=>"WBC", :fullname=>"White Blood Cells", :unit=>"x10<sup>9</sup>/L", :min=>4, :max=>11}, :platelets=>{:name=>"Platelets", :fullname=>"Platelets", :unit=>"x10<sup>9</sup>/L", :min=>140, :max=>440}, :neutrophils=>{:name=>"Neutrophils", :fullname=>"Neutrophils", :unit=>"x10<sup>9</sup>/L", :min=>2.5, :max=>7.5}, :lymphocytes=>{:name=>"Lymphocytes", :fullname=>"Lymphocytes", :unit=>"x10<sup>9</sup>/L", :min=>1.0, :max=>4.8}, :alt=>{:name=>"ALT", :fullname=>"Alanine Aminotransferase", :unit=>"µkat/L", :min=>10, :max=>40}, :alk_phos=>{:name=>"Alk Phos", :fullname=>"Alkaline Phosphates", :unit=>"U/L", :min=>44, :max=>147}, :creatinine=>{:name=>"Creatinine", :fullname=>"Creatinine", :unit=>"μmol/L", :min=>50, :max=>98}, :esr=>{:name=>"ESR", :fullname=>"Erythrocyte Sedimentation Rate", :unit=>"mm/hr", :min=>0, :max=>26}, :crp=>{:name=>"CRP", :fullname=>"C Reactive Protein", :unit=>"mg/L", :min=>0, :max=>5}})
    end

    it 'all' do
      expect(BloodTest).to receive(:order).any_number_of_times.and_return([test])
      expect(BloodTest.all_as_json). to eq("{\"hb\":[{\"date\":\"2013-03-11\",\"result\":12.7}],\"mcv\":[{\"date\":\"2013-03-11\",\"result\":88.0}],\"wbc\":[{\"date\":\"2013-03-11\",\"result\":7.0}],\"platelets\":[{\"date\":\"2013-03-11\",\"result\":278.0}],\"neutrophils\":[{\"date\":\"2013-03-11\",\"result\":4.4}],\"lymphocytes\":[{\"date\":\"2013-03-11\",\"result\":2.0}],\"alt\":[{\"date\":\"2013-03-11\",\"result\":12.0}],\"alk_phos\":[{\"date\":\"2013-03-11\",\"result\":45.0}],\"creatinine\":[{\"date\":\"2013-03-11\",\"result\":50.0}],\"esr\":[{\"date\":\"2013-03-11\",\"result\":9.0}],\"crp\":[]}")
    end

    it 'bad results' do
      expect(BloodTest).to receive(:order).any_number_of_times.and_return([test_with_crp_as_fixnum])
      expect(BloodTest.all_dangerous_results). to eq("{\"2013-03-11\":{\"crp\":7}}")
    end
  end
end

def test_data(crp = '')
  { taken_on: '2013-03-11',
    hb: 12.7,
    mcv: 88.0,
    wbc: 7.0,
    platelets: 278.0,
    neutrophils: 4.4,
    lymphocytes: 2.0,
    alt: 12.0,
    alk_phos: 45,
    creatinine: 50.0,
    esr: 9.0,
    crp: crp
  }
end
