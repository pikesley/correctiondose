class PhysicalExercisesController < GenericController
  private

  def acceptable_params
    params.require(:physical_exercise).permit(:datetime, :duration, :description)
  end
end
