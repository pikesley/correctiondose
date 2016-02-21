class LongtermController < ApplicationController
  before_action :require_login

  def index
    @metrics = [
      BloodPressure.all,
      GlycatedHaemoglobin.all
    ]
  end
end
