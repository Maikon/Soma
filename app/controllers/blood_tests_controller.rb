class BloodTestsController < ApplicationController
  def new
    @blood_test = BloodTest.new
  end

  def create
    blood_test = BloodTest.new(blood_test_params)
    if blood_test.save
      redirect_to blood_tests_path
    else
      flash[:errors] = blood_test.error_messages
      redirect_to new_blood_test_path
    end
  end

  def index
    @blood_tests = BloodTest.order('taken_on DESC')
    respond_to do |format|
      format.html
      format.json { render json: @blood_tests.to_json }
    end
  end

  def hb
    render json: BloodTest.hemoglobin_levels_over_time_as_json
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
