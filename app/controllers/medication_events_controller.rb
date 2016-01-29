class MedicationEventsController < GenericController
  private

  def metrics_path
    medication_events_path
  end

  def acceptable_params
    params.require(:medication_event).permit(:datetime, :amount, :insulin)
  end
end
