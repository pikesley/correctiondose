class GlucoseMeasurementController < ApplicationController
  before_action :require_login

  def index
    @measurements = GlucoseMeasurement.all
  end

  def show
    @measurement = GlucoseMeasurement.find(params[:id])
  end

  def new
    @measurement = GlucoseMeasurement.new
  end

  def create
    @measurement = GlucoseMeasurement.new(measurement_params)
    if @measurement.save
      redirect_to @measurement
    else
      render 'new'
    end
  end

  private

  def measurement_params
    params.require(:measurement).permit(:time, :value)
  end
end
