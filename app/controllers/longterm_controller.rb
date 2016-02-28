class LongtermController < ApplicationController
  include ControllerHelpers

  before_action :require_login

  def index
    @sets = []

    [
      GlycatedHaemoglobin,
      BloodPressure
    ].each do |model|
      metrics = model.all
      bucketed_metrics = bucket metrics
      with_year = with_year metrics

      @sets.push({
        model: model,
        metrics: metrics,
        bucketed_metrics: bucketed_metrics,
        with_year: with_year
      })
    end

#This should be dependent on whether there's any data
    @no_picker = true;
  end
end
