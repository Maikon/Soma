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

    it 'should know if WBC is within range' do
      test.wbc = 5
      expect(test).to have_healthy_wbc
    end

    it 'should know if WBC is out of range' do
      test.wbc = 12
      expect(test).not_to have_healthy_wbc
    end

    it 'should know if Platelets is within range' do
      test.platelets = 141
      expect(test).to have_healthy_platelets
    end

    it 'should know if Platelets is out of range' do
      test.platelets = 139
      expect(test).not_to have_healthy_platelets
    end

    it 'should know if Neutrophils is within range' do
      test.neutrophils = 2.6
      expect(test).to have_healthy_neutrophils
    end

    it 'should know if Neutrophils is out of range' do
      test.neutrophils = 7.6
      expect(test).not_to have_healthy_neutrophils
    end

    it 'should know if Lymphocytes is within range' do
      test.lymphocytes = 1.1
      expect(test).to have_healthy_lymphocytes
    end

    it 'should know if Lymphocytes is out of range' do
      test.lymphocytes = 4.9
      expect(test).not_to have_healthy_lymphocytes
    end

    it 'should know if Alt is within range' do
      test.alt = 11
      expect(test).to have_healthy_alt
    end

    it 'should know if Alt is out of range' do
      test.alt = 41
      expect(test).not_to have_healthy_alt
    end
  end
end
