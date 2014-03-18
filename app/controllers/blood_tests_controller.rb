class BloodTestsController < ApplicationController
  def new
    @blood_test = BloodTest.new
  end

  def create
    @blood_test = BloodTest.create(blood_test_params)
    redirect_to blood_tests_path
  end

  def index
    @blood_tests = BloodTest.all
    methods
  end

  private

  def blood_test_params
    params.require(:blood_test).permit(
      :taken_on,
      :hb,
      :mcv,
      :wbc,
      :platelets,
      :neutrophils,
      :lymphocytes,
      :alt,
      :alk_phos,
      :creatinine,
      :esr,
      :crp
      )
  end
end
