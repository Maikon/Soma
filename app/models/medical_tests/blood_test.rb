class BloodTest < MedicalTest
  def has_healthy_hb?
    hb >= 12 && hb <= 16
  end

  def has_healthy_mcv?
    mcv >= 80 && mcv <= 100
  end

  def has_healthy_wbc?
    wbc >= 4 && wbc <= 11
  end

  def has_healthy_platelets?
    platelets >= 140 && platelets <= 440
  end

  def has_healthy_neutrophils?
    neutrophils >= 2.5 && neutrophils <= 7.5
  end

  def has_healthy_lymphocytes?
    lymphocytes >= 1.0 && lymphocytes <= 4.8
  end

  def has_healthy_alt?
    alt >= 10 && alt <= 40
  end
end
