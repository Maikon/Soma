require 'spec_helper'

describe BloodTest do
  let(:test) do
    BloodTest.new(taken_on: "2013-03-11", 
      hb: 12.7, mcv: 88.0, 
      wbc: 7.0, platelets: 278.0, neutrophils: 4.4, 
      lymphocytes: 2.0, alt: 12.0, alk_phos: 45, 
      creatinine: 50.0, esr: 9.0, crp: nil)
  end

  it "should be able to return nicely formatted messages" do
    expect(test).to receive(:errors).and_return(key: "error")
    expect(test.error_messages).to eq(["error"])
  end

  context "Must return JSON data for" do
    it "Hb" do
      expect(BloodTest).to receive(:order).and_return ([test])
      expect(BloodTest.as_json(:hb)). to eq("[{\"date\":\"2013-03-11\",\"result\":12.7}]")
    end 

    # it "should not return data for empty result" do
    #   expect(BloodTest).to receive(:order).and_return ([test])
    #   expect(BloodTest.as_json(:crp)). to eq("nothing")
    # end
  end
end
