class BloodTest < MedicalTest
  def has_healthy_hb?
    hb >= 12 && hb <= 16
  end

  def has_healthy_mcv?
    mcv >= 80 && mcv <= 100
  end
end
