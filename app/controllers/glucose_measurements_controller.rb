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

  def edit
    @glucose_measurement = GlucoseMeasurement.find(params[:id])
  end

  def create
    @glucose_measurement = GlucoseMeasurement.new(glucose_measurement_params)
    if @glucose_measurement.save
      redirect_to @glucose_measurement
    else
      render 'new'
    end
  end

  def update
    @glucose_measurement = GlucoseMeasurement.find(params[:id])

    if @glucose_measurement.update(glucose_measurement_params)
      redirect_to @glucose_measurement
    else
      render 'edit'
    end
  end

  def destroy
    @glucose_measurement = GlucoseMeasurement.find(params[:id])
    @glucose_measurement.destroy

    redirect_to glucose_measurements_path
  end

  private

  def glucose_measurement_params
    params.require(:glucose_measurement).permit(:datetime, :value)
  end
end
