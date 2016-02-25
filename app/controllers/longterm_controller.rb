class LongtermController < ApplicationController
  before_action :require_login

  def index
    @metrics = [
      GlycatedHaemoglobin,
      BloodPressure
    ]

    @datas = [
      ControllerHelpers.for_table(GlycatedHaemoglobin.all),
      ControllerHelpers.for_table(BloodPressure.all)
    ]

    @no_picker = true;
  end
end
