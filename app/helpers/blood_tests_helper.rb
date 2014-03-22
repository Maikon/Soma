require 'blood_probe'

module BloodTestsHelper

  nine = "<sup>9</sup>"
  # To use this: <%= BloodProbe::WHITE_BLOOD_CELLS_UNIT.html_safe  %>
  HEMOGLOBIN_UNIT                      = "g/L"
  MEAN_CELL_VOLUME_UNIT                = "fL"
  WHITE_BLOOD_CELLS_UNIT               = "x10"+nine+"/L"
  PLATELETS_UNIT                       = "x10"+nine+"/L"
  NEUTROPHILS_UNIT                     = "x10"+nine+"/L"
  LYMPHOCYTES_UNIT                     = "x10"+nine+"/L"
  ALANINE_AMINOTRANSFERASE_UNIT        = "µkat/L"
  ALKALINE_PHOSPHATASE_UNIT            = "U/L"
  CREATININE_UNIT                      = "μmol/L"
  ERYTHROCYTE_SEDIMENTATION_RATE_UNIT  = "mm/hr"
  C_REACTIVE_PROTEIN_UNIT              = "mg/L"

UNITS = {
    hemoglobin:                     HEMOGLOBIN_UNIT,
    hb:                             HEMOGLOBIN_UNIT,
    mean_cell_volume:               MEAN_CELL_VOLUME_UNIT,
    mcv:                            MEAN_CELL_VOLUME_UNIT,
    white_blood_cells:              WHITE_BLOOD_CELLS_UNIT,
    wbc:                            WHITE_BLOOD_CELLS_UNIT,
    platelets:                      PLATELETS_UNIT,
    neutrophils:                    NEUTROPHILS_UNIT,
    lymphocytes:                    LYMPHOCYTES_UNIT,
    alanine_aminotransferase:       ALANINE_AMINOTRANSFERASE_UNIT,
    alt:                            ALANINE_AMINOTRANSFERASE_UNIT,
    alkaline_phosphatase:           ALKALINE_PHOSPHATASE_UNIT,
    alk_phos:                       ALKALINE_PHOSPHATASE_UNIT,
    creatinine:                     CREATININE_UNIT,
    erythrocyte_sedimentation_rate: ERYTHROCYTE_SEDIMENTATION_RATE_UNIT,
    esr:                            ERYTHROCYTE_SEDIMENTATION_RATE_UNIT,
    c_reactive_protein:             C_REACTIVE_PROTEIN_UNIT,
    crp:                            C_REACTIVE_PROTEIN_UNIT
  }

  TEST_NAMES = [:hb,:mcv,:wbc,:platelets,:neutrophils,:lymphocytes,:alt,:alk_phos,:creatinine,:esr,:crp]

  HEADERS = {
    hemoglobin:                     "Hb",
    hb:                             "Hb",
    mean_cell_volume:               "MCV",
    mcv:                            "MCV",
    white_blood_cells:              "WBC",
    wbc:                            "WBC",
    platelets:                      "Platelets",
    neutrophils:                    "Neutrophils",
    lymphocytes:                    "Lymphocytes",
    alanine_aminotransferase:       "ALT",
    alt:                            "ALT",
    alkaline_phosphatase:           "Alk Phos",
    alk_phos:                       "Alk Phos",
    creatinine:                     "Creatinine",
    erythrocyte_sedimentation_rate: "ESR",
    esr:                            "ESR",
    c_reactive_protein:             "CRP",
    crp:                            "CRP"
  }

  FULLNAMES = {
    hemoglobin:                     "Haemoglobin",
    hb:                             "Haemoglobin",
    mean_cell_volume:               "Mean Cell Volume",
    mcv:                            "Mean Cell Volume",
    white_blood_cells:              "White Blood Cells",
    wbc:                            "White Blood Cells",
    platelets:                      "Platelets",
    neutrophils:                    "Neutrophils",
    lymphocytes:                    "Lymphocytes",
    alanine_aminotransferase:       "Alanine Aminotransferase",
    alt:                            "Alanine Aminotransferase",
    alkaline_phosphatase:           "Alkaline Phosphates",
    alk_phos:                       "Alkaline Phosphates",
    creatinine:                     "Creatinine",
    erythrocyte_sedimentation_rate: "Erythrocyte Sedimentation Rate",
    esr:                            "Erythrocyte Sedimentation Rate",
    c_reactive_protein:             "C Reactive Protein",
    crp:                            "C Reactive Protein"
  }

  def class_for(test, method)
    return "class=empty-value" if has_empty_value?(test, method)
    probe = BloodProbe.new(test)
    if probe.within_range? method.to_sym
      "class=no-danger"
    else
      "class=danger"
    end
  end

  def value_for(test, method)
    test.send("#{method}".to_sym)
  end

  def has_empty_value?(test,method)
    value_for(test, method).nil? || value_for(test, method) == ''
  end
end
