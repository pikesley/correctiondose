class WelcomeController < ApplicationController
  before_action :require_login

  def index
    @hours = 72
    if params[:hours]
      @hours = hours(params[:hours]) ? hours(params[:hours]) : @hours
    end

    @metrics = {}
    [
      GlucoseMeasurement,
      CarbohydrateIntake,
      MedicationEvent
    ].each do |model|
      model.where(datetime: (Time.now - @hours.hours)..Time.now).group_by do |g|
        g.datetime.strftime "%Y-%m-%d"
      end.each_pair do |date, metric|
        begin
          @metrics[date] << metric.first
        rescue NoMethodError
          @metrics[date] = metric
        end
      end
    end

    @data = ControllerHelpers.for_table @metrics
    @widest = ControllerHelpers.widest @data
  end

  private

  def hours parameter
    return parameter.to_i if parameter.to_i > 0
  end
end
