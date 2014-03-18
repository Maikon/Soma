class BloodTest < MedicalTest
  validates_uniqueness_of :taken_on

  def has_healthy_hb?
    # this varies between ladies and men
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

  def has_healthy_alk_phos?
    alk_phos >= 44 && alk_phos <= 147
  end

  def has_healthy_creatinine?
    # this varies between ladies and men
    creatinine >= 50 && creatinine <= 98
  end

  def has_healthy_esr?
    # age is a factor (age + 10) / 2 for ladies
    esr >= 0 && esr <= 26
  end

  def has_healthy_crp?
    if crp =~ /^<(?:5|4|3|2|1)$/
      true
    elsif crp =~ /^\d+$/
      crp.to_f <= 5
    else
      false
    end
  end

  def error_messages
    errors.inject([]) do |array, (attr, message)|
      array << message
    end
  end
end
