require 'blood_probe'

describe BloodProbe do
  let(:blood_test) do
    BloodTest.new(taken_on: "2013-03-11", 
      hb: 12.7, mcv: 88.0, 
      wbc: 7.0, platelets: 278.0, neutrophils: 4.4, 
      lymphocytes: 2.0, alt: 12.0, alk_phos: 45, 
      creatinine: 50.0, esr: 9.0, crp: 5)
  end

  let(:probe) { BloodProbe.new(blood_test) }
  
  context 'checking ranges for' do
    it 'hemoglobin' do
      expect(probe.within_range?(:hemoglobin)).to be_true
    end

    it 'hemoglobin using hb' do
      expect(probe.within_range?(:hb)).to be_true
    end

    it 'hemoglobin out of range' do
      blood_test.hb= 11
      expect(probe.within_range?(:hemoglobin)).to be_false
    end

    it 'mean cell volume' do
      expect(probe.within_range?(:mean_cell_volume)).to be_true
    end

    it 'mean cell volume using mcv' do
      expect(probe.within_range?(:mcv)).to be_true
    end

    it 'mean cell volume out of range' do
      blood_test.mcv= 70
      expect(probe.within_range?(:mcv)).to be_false
    end

    it 'white blood cells' do
      expect(probe.within_range?(:white_blood_cells)).to be_true
    end

    it 'white blood cells using wbc' do
      expect(probe.within_range?(:wbc)).to be_true
    end

    it 'white blood cells out of range' do
      blood_test.wbc= 12
      expect(probe.within_range?(:white_blood_cells)).to be_false
    end

    it 'platelets' do
      expect(probe.within_range?(:platelets)).to be_true
    end

    it 'platelets out of range' do
      blood_test.platelets= 12
      expect(probe.within_range?(:platelets)).to be_false
    end

    it 'neutrophils' do
      expect(probe.within_range?(:neutrophils)).to be_true
    end

    it 'neutrophils out of range' do
      blood_test.neutrophils= 1
      expect(probe.within_range?(:neutrophils)).to be_false
    end

    it 'lymphocytes' do
      expect(probe.within_range?(:lymphocytes)).to be_true
    end

    it 'lymphocytes out of range' do
      blood_test.lymphocytes= 5
      expect(probe.within_range?(:lymphocytes)).to be_false
    end

    it 'Alanine Aminotransferase' do
      expect(probe.within_range?(:alanine_aminotransferase)).to be_true
    end

    it 'Alanine Aminotransferase using alt' do
      expect(probe.within_range?(:alt)).to be_true
    end

    it 'Alanine Aminotransferase out of range' do
      blood_test.alt= 50
      expect(probe.within_range?(:alanine_aminotransferase)).to be_false
    end

    it 'Alkaline phosphatase' do
      expect(probe.within_range?(:alkaline_phosphatase)).to be_true
    end

    it 'Alkaline phosphatase using alt' do
      expect(probe.within_range?(:alk_phos)).to be_true
    end

    it 'Alkaline phosphatase out of range' do
      blood_test.alk_phos= 40
      expect(probe.within_range?(:alkaline_phosphatase)).to be_false
    end

    it 'Creatinine' do
      expect(probe.within_range?(:creatinine)).to be_true
    end

    it 'Creatinine out of range' do
      blood_test.creatinine= 40
      expect(probe.within_range?(:creatinine)).to be_false
    end

    it 'erythrocyte sedimentation rate' do
      expect(probe.within_range?(:erythrocyte_sedimentation_rate)).to be_true
    end

    it 'erythrocyte sedimentation rate using esr' do
      expect(probe.within_range?(:esr)).to be_true
    end

    it 'erythrocyte sedimentation rate out of range' do
      blood_test.esr=28
      expect(probe.within_range?(:erythrocyte_sedimentation_rate)).to be_false
    end

    it 'c-reactive protein' do
      expect(probe.within_range?(:c_reactive_protein)).to be_true
    end

    it 'c-reactive protein using crp' do
      expect(probe.within_range?(:crp)).to be_true
    end

    it 'c-reactive protein out of range' do
      blood_test.crp= 8
      expect(probe.within_range?(:c_reactive_protein)).to be_false
    end

  end
end