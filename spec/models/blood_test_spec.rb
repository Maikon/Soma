require 'spec_helper'

describe BloodTest do
  let(:test) do
    BloodTest.new(taken_on: "2013-03-11", 
      hb: 12.7, mcv: 88.0, 
      wbc: 7.0, platelets: 278.0, neutrophils: 4.4, 
      lymphocytes: 2.0, alt: 12.0, alk_phos: 45, 
      creatinine: 50.0, esr: 9.0, crp: nil)
  end
  let(:test_with_crp) do
    BloodTest.new(taken_on: "2013-03-11", 
      hb: 12.7, mcv: 88.0, 
      wbc: 7.0, platelets: 278.0, neutrophils: 4.4, 
      lymphocytes: 2.0, alt: 12.0, alk_phos: 45, 
      creatinine: 50.0, esr: 9.0, crp: 3)
  end

  it "should be able to return nicely formatted messages" do
    expect(test).to receive(:errors).and_return(key: "error")
    expect(test.error_messages).to eq(["error"])
  end

  context "Must return JSON data for" do
    it "Hb" do
      expect(BloodTest).to receive(:order).and_return ([test])
      expect(BloodTest.as_json(:hb)).to eq("[{\"date\":\"2013-03-11\",\"result\":12.7}]")
    end 

    it "should not return data for empty result" do
      expect(BloodTest).to receive(:order).and_return ([test, test_with_crp])
      expect(BloodTest.as_json(:crp)).to eq("[{\"date\":\"2013-03-11\",\"result\":3}]")
    end

    it "the legend" do
      expect(BloodTest.legend_as_json).to eq({:hb=>{:name=>"Hb", :fullname=>"Haemoglobin", :unit=>"g/L", :min=>16, :max=>11.5}, :mcv=>{:name=>"MCV", :fullname=>"Mean Cell Volume", :unit=>"fL", :min=>100, :max=>80}, :wbc=>{:name=>"WBC", :fullname=>"White Blood Cells", :unit=>"x10<sup>9</sup>/L", :min=>11, :max=>4}, :platelets=>{:name=>"Platelets", :fullname=>"Platelets", :unit=>"x10<sup>9</sup>/L", :min=>440, :max=>140}, :neutrophils=>{:name=>"Neutrophils", :fullname=>"Neutrophils", :unit=>"x10<sup>9</sup>/L", :min=>7.5, :max=>2.5}, :lymphocytes=>{:name=>"Lymphocytes", :fullname=>"Lymphocytes", :unit=>"x10<sup>9</sup>/L", :min=>4.8, :max=>1.0}, :alt=>{:name=>"ALT", :fullname=>"Alanine Aminotransferase", :unit=>"µkat/L", :min=>40, :max=>10}, :alk_phos=>{:name=>"Alk Phos", :fullname=>"Alkaline Phosphates", :unit=>"U/L", :min=>147, :max=>44}, :creatinine=>{:name=>"Creatinine", :fullname=>"Creatinine", :unit=>"μmol/L", :min=>98, :max=>50}, :esr=>{:name=>"ESR", :fullname=>"Erythrocyte Sedimentation Rate", :unit=>"mm/hr", :min=>26, :max=>0}, :crp=>{:name=>"CRP", :fullname=>"C Reactive Protein", :unit=>"mg/L", :min=>5, :max=>0}})
    end
  end
end
