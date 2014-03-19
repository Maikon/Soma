class DashboardController < ApplicationController
  def index
    @blood_tests = BloodTest.order('taken_on DESC')
  end
end
