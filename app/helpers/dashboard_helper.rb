module DashboardHelper
  def blood_name_and_ranges
    { hb: BloodProbe::HEMOGLOBIN_RANGE,
      mcv: BloodProbe::MEAN_CELL_VOLUME_RANGE,
      wbc: BloodProbe::WHITE_BLOOD_CELLS_RANGE,
      platelets: BloodProbe::PLATELETS_RANGE ,
      neutrophils: BloodProbe::NEUTROPHILS_RANGE,
      lymphocytes: BloodProbe::LYMPHOCYTES_RANGE,
      alt: BloodProbe::ALANINE_AMINOTRANSFERASE_RANGE,
      alk_phos: BloodProbe::ALKALINE_PHOSPHATASE_RANGE,
      creatinine: BloodProbe::CREATININE_RANGE,
      esr: BloodProbe::ERYTHROCYTE_SEDIMENTATION_RATE_RANGE
    }
  end
end
