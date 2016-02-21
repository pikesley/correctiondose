class BloodPressuresController < GenericController
  private

  def acceptable_params
    params.require(:blood_pressure).permit(:datetime, :reading)
  end
end
