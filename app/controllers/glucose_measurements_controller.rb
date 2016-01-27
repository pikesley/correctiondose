class GlucoseMeasurementsController < ApplicationController
  before_action :require_login

  def index
    @glucose_measurements = GlucoseMeasurement.all
  end

  def show
    @glucose_measurement = GlucoseMeasurement.find(params[:id])
  end

  def new
    @glucose_measurement = GlucoseMeasurement.new
  end

  def create
    @glucose_measurement = GlucoseMeasurement.new(glucose_measurement_params)
    if @glucose_measurement.save
      redirect_to @glucose_measurement
    else
      render 'new'
    end
  end

  private

  def glucose_measurement_params
    params.require(:glucose_measurement).permit(:time, :value)
  end
end
