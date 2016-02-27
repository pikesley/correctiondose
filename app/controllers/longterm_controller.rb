class LongtermController < ApplicationController
  before_action :require_login

  def index
    @sets = [
      {
        model: GlycatedHaemoglobin,
        metrics: GlycatedHaemoglobin.all,
        bucketed_metrics: GlycatedHaemoglobin.all.group_by { |g| g.datetime.strftime "%Y-%m-%d" }
      },
      {
        model: BloodPressure,
        metrics: BloodPressure.all,
        bucketed_metrics: BloodPressure.all.group_by { |g| g.datetime.strftime "%Y-%m-%d" }
      }
    ]

    @no_picker = true;
    @with_year = true;
  end
end
