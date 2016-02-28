class LongtermController < ApplicationController
  before_action :require_login

  def index
    @sets = []

    [
      GlycatedHaemoglobin,
      BloodPressure
    ].each do |model|
      metrics = model.all
      bucketed_metrics = metrics.group_by { |g| g.datetime.strftime "%Y-%m-%d" }
      with_year = begin
        metrics.first.datetime.year < Time.now.year
      rescue NoMethodError
        nil
      end

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
