class BloodProbe < Struct.new(:blood_test)
  HEMOGLOBIN_RANGE                      = 11.5..16
  MEAN_CELL_VOLUME_RANGE                = 80..100
  WHITE_BLOOD_CELLS_RANGE               = 4..11
  PLATELETS_RANGE                       = 140..440
  NEUTROPHILS_RANGE                     = 2.5..7.5
  LYMPHOCYTES_RANGE                     = 1.0..4.8
  ALANINE_AMINOTRANSFERASE_RANGE        = 10..40
  ALKALINE_PHOSPHATASE_RANGE            = 44..147
  CREATININE_RANGE                      = 50..98
  ERYTHROCYTE_SEDIMENTATION_RATE_RANGE  = 0..26
  C_REACTIVE_PROTEIN_RANGE              = 0..5

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

  HEMOGLOBIN_TEST               = ->(test) { HEMOGLOBIN_RANGE.include? test.hb                 }
  MEAN_CELL_VOLUME_TEST         = ->(test) { MEAN_CELL_VOLUME_RANGE.include? test.mcv          }
  WHITE_BLOOD_CELLS_TEST        = ->(test) { WHITE_BLOOD_CELLS_RANGE.include? test.wbc         }
  PLATELETS_TEST                = ->(test) { PLATELETS_RANGE.include? test.platelets           }
  NEUTROPHILS_TEST              = ->(test) { NEUTROPHILS_RANGE.include? test.neutrophils       }
  LYMPHOCYTES_TEST              = ->(test) { LYMPHOCYTES_RANGE.include? test.lymphocytes       }
  ALANINE_AMINOTRANSFERASE_TEST = ->(test) { ALANINE_AMINOTRANSFERASE_RANGE.include? test.alt  }
  ALKALINE_PHOSPHATASE_TEST     = ->(test) { ALKALINE_PHOSPHATASE_RANGE.include? test.alk_phos }
  CREATININE_TEST               = ->(test) { CREATININE_RANGE.include? test.creatinine         }
  ERYTHROCYTE_SEDIMENTATION_RATE_TEST = ->(test) { ERYTHROCYTE_SEDIMENTATION_RATE_RANGE.include? test.esr }
  C_REACTIVE_PROTEIN_TEST = ->(test) do
    return true if test.crp =~ /^<(?:5|4|3|2|1)$/
    return C_REACTIVE_PROTEIN_RANGE.include? test.crp.to_f if test.crp =~ /^\d+$/
    return false
  end

  RANGES = {
    hemoglobin:                     HEMOGLOBIN_RANGE,
    hb:                             HEMOGLOBIN_RANGE,
    mean_cell_volume:               MEAN_CELL_VOLUME_RANGE,
    mcv:                            MEAN_CELL_VOLUME_RANGE,
    white_blood_cells:              WHITE_BLOOD_CELLS_RANGE,
    wbc:                            WHITE_BLOOD_CELLS_RANGE,
    platelets:                      PLATELETS_RANGE,
    neutrophils:                    NEUTROPHILS_RANGE,
    lymphocytes:                    LYMPHOCYTES_RANGE,
    alanine_aminotransferase:       ALANINE_AMINOTRANSFERASE_RANGE,
    alt:                            ALANINE_AMINOTRANSFERASE_RANGE,
    alkaline_phosphatase:           ALKALINE_PHOSPHATASE_RANGE,
    alk_phos:                       ALKALINE_PHOSPHATASE_RANGE,
    creatinine:                     CREATININE_RANGE,
    erythrocyte_sedimentation_rate: ERYTHROCYTE_SEDIMENTATION_RATE_RANGE,
    esr:                            ERYTHROCYTE_SEDIMENTATION_RATE_RANGE,
    c_reactive_protein:             C_REACTIVE_PROTEIN_RANGE,
    crp:                            C_REACTIVE_PROTEIN_RANGE
  }

  # Probably need to test this at some point... maybe...
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


  METHODS = {
    hemoglobin: HEMOGLOBIN_TEST, hb: HEMOGLOBIN_TEST,
    mean_cell_volume: MEAN_CELL_VOLUME_TEST, mcv: MEAN_CELL_VOLUME_TEST,
    white_blood_cells: WHITE_BLOOD_CELLS_TEST, wbc: WHITE_BLOOD_CELLS_TEST,
    platelets: PLATELETS_TEST,
    neutrophils: NEUTROPHILS_TEST,
    lymphocytes: LYMPHOCYTES_TEST,
    alanine_aminotransferase: ALANINE_AMINOTRANSFERASE_TEST, alt: ALANINE_AMINOTRANSFERASE_TEST,
    alkaline_phosphatase: ALKALINE_PHOSPHATASE_TEST, alk_phos: ALKALINE_PHOSPHATASE_TEST,
    creatinine: CREATININE_TEST,
    esr: ERYTHROCYTE_SEDIMENTATION_RATE_TEST, erythrocyte_sedimentation_rate: ERYTHROCYTE_SEDIMENTATION_RATE_TEST,
    crp: C_REACTIVE_PROTEIN_TEST, c_reactive_protein: C_REACTIVE_PROTEIN_TEST
  }

  def within_range?(method)
    METHODS[method].call(blood_test)
  end

  def empty_value?(method)
    blood_test.send(method.to_sym).nil? || blood_test.send(method.to_sym) == ''
  end
end
