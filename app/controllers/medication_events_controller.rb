class MedicationEventsController < GenericController
  private

  def acceptable_params
    params.require(:medication_event).permit(:datetime, :amount, :insulin)
  end
end
