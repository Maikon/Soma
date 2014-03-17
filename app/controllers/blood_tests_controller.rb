class BloodTestsController < ApplicationController
  def new
    @blood_test = BloodTest.new
  end
end
