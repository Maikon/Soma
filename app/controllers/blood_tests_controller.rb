class BloodTestsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

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
    respond_to do |format|
      format.html
      format.json { render json: @blood_test.to_json }
    end
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

  def create_remote
    @blood_test = BloodTest.new_from_remote(params[:blood_test])
    if @blood_test.save
      render json: @blood_test.to_json
    else
      flash.now[:errors] = @blood_test.error_messages
      render action: 'new'
    end
  end

  def results_by_testname
    render json: BloodTest.as_json(params[:name])
  end

  def legend
    app = App.find_by_token(params[:token])
    if app
      render json: BloodTest.legend_as_json
    else
      render json: "NOPE"
    end
  end

  def all_results
    render json: BloodTest.all_as_json
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
