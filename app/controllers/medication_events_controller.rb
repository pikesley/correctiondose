class MedicationEventsController < GenericController
  private

  def acceptable_params
    params.require(:medication_event).permit(:datetime, :dose, :insulin)
  end
end
