class WelcomeController < ApplicationController
  def index
    @hours = 36
    @metrics = []
    [
      GlucoseMeasurement,
      CarbohydrateIntake,
      MedicationEvent
    ].each do |model|
      @metrics.concat model.where(datetime: (Time.now - @hours.hours)..Time.now)
    end

    @widest = widest @metrics
  end

  private

  def widest metrics
    metrics.map { |m| m.class }.uniq.map { |u| u.fields.count }.max
  end
end
