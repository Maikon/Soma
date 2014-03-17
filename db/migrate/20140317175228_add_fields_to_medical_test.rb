class AddFieldsToMedicalTest < ActiveRecord::Migration
  def change
    add_column :medical_tests, :hb, :float
    add_column :medical_tests, :mcv, :float
    add_column :medical_tests, :wbc, :float
    add_column :medical_tests, :platelets, :float
    add_column :medical_tests, :neutrophils, :float
    add_column :medical_tests, :lymphocytes, :float
    add_column :medical_tests, :alt, :float
    add_column :medical_tests, :alk_phos, :float
    add_column :medical_tests, :creatinine, :float
    add_column :medical_tests, :esr, :float
    add_column :medical_tests, :crp, :string
  end
end
