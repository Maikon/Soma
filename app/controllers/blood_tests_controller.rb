class BloodTestsController < ApplicationController
  def new
    @blood_test = BloodTest.new
  end

  def create
    @blood_test = BloodTest.new(blood_test_params)
    if @blood_test.save
      redirect_to blood_test_path(@blood_test)
    else
      flash.now[:errors] = @blood_test.error_messages
      render action: 'new'
    end
  end

  def show
    @blood_test = BloodTest.find(params[:id])
    @probe = BloodProbe.new(@blood_test)
  end

  def edit
    @blood_test = BloodTest.find(params[:id])
  end

  def update
    @blood_test = BloodTest.find(params[:id])
    @blood_test.update_attributes(blood_test_params)
    redirect_to blood_tests_path
  end

  def destroy
    @blood_test = BloodTest.find(params[:id])
    @blood_test.destroy
    redirect_to blood_tests_path
  end

  def index
    @blood_tests = BloodTest.order('taken_on DESC')
    respond_to do |format|
      format.html
      format.json { render json: @blood_tests.to_json }
    end
  end

  def results
    render json: BloodTest.as_json(params[:name])
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
