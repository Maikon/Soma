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
  C_REACTIVE_PROTEIN_RANGE              = 0..6

  
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
  C_REACTIVE_PROTEIN_TEST       = ->(test) { C_REACTIVE_PROTEIN_RANGE.include? test.crp        }

  RANGES = {
    hemoglobin:                     HEMOGLOBIN_RANGE,
    mean_cell_volume:               MEAN_CELL_VOLUME_RANGE,
    white_blood_cells:              WHITE_BLOOD_CELLS_RANGE,
    platelets:                      PLATELETS_RANGE,
    neutrophils:                    NEUTROPHILS_RANGE,
    lymphocytes:                    LYMPHOCYTES_RANGE,
    alanine_aminotransferase:       ALANINE_AMINOTRANSFERASE_RANGE,
    alkaline_phosphatase:           ALKALINE_PHOSPHATASE_RANGE,
    creatinine:                     CREATININE_RANGE,
    erythrocyte_sedimentation_rate: ERYTHROCYTE_SEDIMENTATION_RATE_RANGE,
    c_reactive_protein:             C_REACTIVE_PROTEIN_RANGE 
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

  def within_range? method
    METHODS[method].call(blood_test)
  end


end