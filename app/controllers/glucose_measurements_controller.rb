class GlucoseMeasurementsController < GenericController
  private

  def acceptable_params
    params.require(:glucose_measurement).permit(:datetime, :value)
  end
end
