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

  def headers
    ["Taken on",
      "Hb",
      "MCV",
      "WBC",
      "Platelets",
      "Neutrophils",
      "Lymphocytes",
      "ALT",
      "Alk Phos",
      "Creatinine",
      "ESR",
      "CRP"
    ]
  end

  def methods
    ["hb",
      "mcv",
      "wbc",
      "platelets",
      "neutrophils",
      "lymphocytes",
      "alt",
      "alk_phos",
      "creatinine",
      "esr",
      "crp"
    ]
  end

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
