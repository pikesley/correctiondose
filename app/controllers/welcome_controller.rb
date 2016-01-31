class WelcomeController < ApplicationController
  def index
    @metrics = []
    [
      GlucoseMeasurement,
      CarbohydrateIntake,
      MedicationEvent
    ].each do |model|
      @metrics.concat model.where(datetime: (Time.now - 48.hours)..Time.now)
    end
  end
end
