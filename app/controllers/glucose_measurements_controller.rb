class GlucoseMeasurementsController < GenericController
  before_action :require_login

  def update
    @glucose_measurement = GlucoseMeasurement.find(params[:id])

    if @glucose_measurement.update(acceptable_params)
      redirect_to glucose_measurements_path
    else
      render :edit
    end
  end

  def destroy
    @glucose_measurement = GlucoseMeasurement.find(params[:id])
    @glucose_measurement.destroy

    redirect_to glucose_measurements_path
  end

  private

  def metrics_path
    glucose_measurements_path
  end

  def acceptable_params
    params.require(:glucose_measurement).permit(:datetime, :value)
  end
end
