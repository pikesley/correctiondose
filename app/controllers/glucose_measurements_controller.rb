class GlucoseMeasurementsController < GenericController
  def show
    super
    @bg = GlucoseMeasurementPresenter.new @metric
  end

  private

  def acceptable_params
    params.require(:glucose_measurement).permit(:datetime, :value)
  end
end
