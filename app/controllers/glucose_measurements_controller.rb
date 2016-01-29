class GlucoseMeasurementsController < GenericController
  private

  def metrics_path
    glucose_measurements_path
  end

  def acceptable_params
    params.require(:glucose_measurement).permit(:datetime, :value)
  end
end
