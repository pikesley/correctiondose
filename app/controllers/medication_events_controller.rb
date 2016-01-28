class MedicationEventsController < ApplicationController
  before_action :require_login

  def index
    @medication_events = MedicationEvent.all
  end

  def show
    @medication_event = MedicationEvent.find(params[:id])
  end

  def new
    @medication_event = MedicationEvent.new
  end

  def edit
    @medication_event = MedicationEvent.find(params[:id])
  end

  def create
    @medication_event = MedicationEvent.new(medication_event_params)
    if @medication_event.save
      redirect_to medication_events_path
    else
      render :new
    end
  end

  def update
    @medication_event = MedicationEvent.find(params[:id])

    if @medication_event.update(medication_event_params)
      redirect_to medication_events_path
    else
      render :edit
    end
  end

  def destroy
    @medication_event = MedicationEvent.find(params[:id])
    @medication_event.destroy

    redirect_to medication_events_path
  end

  private

  def medication_event_params
    params.require(:medication_event).permit(:datetime, :amount, :insulin)
  end
end
