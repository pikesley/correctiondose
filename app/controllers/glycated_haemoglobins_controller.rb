class GlycatedHaemoglobinsController < GenericController
  private

  def acceptable_params
    params.require(:glycated_haemoglobin).permit(:datetime, :percentage)
  end
end
