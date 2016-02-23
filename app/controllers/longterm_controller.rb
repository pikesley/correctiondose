class LongtermController < ApplicationController
  before_action :require_login

  def index
    @metrics = [
      GlycatedHaemoglobin.all,
      BloodPressure.all
    ]
  end
end
