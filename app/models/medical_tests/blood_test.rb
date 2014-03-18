class BloodTest < MedicalTest
  def has_healthy_hb?
    hb >= 12 && hb <= 16
  end
end
