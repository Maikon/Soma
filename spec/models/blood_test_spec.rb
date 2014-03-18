require 'spec_helper'

describe BloodTest do
  let(:test) { BloodTest.new }

  context 'Checking for ranges' do

    it 'should know if Hb is within range' do
      test.hb = 15
      expect(test).to have_healthy_hb
    end

    it 'should know if Hb is out of range' do
      test.hb = 300
      expect(test).not_to have_healthy_hb
    end

    it 'should know if MCV is within range' do
      test.mcv = 90
      expect(test).to have_healthy_mcv
    end

    it 'should know if MCV is out of range' do
      test.mcv = 70
      expect(test).not_to have_healthy_mcv
    end
  end
end
