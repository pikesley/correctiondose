class MedicationEventPresenter < GenericPresenter
  def edit_cell
    super :edit_medication_event_path
  end

  def number_span
    super :dose
  end

  def value_div
    super :dose
  end

  def measurement_cell
    cell value_div, 'medication-event-dose'
  end

  def meds_cell
    cell model.insulin, 'medication-event-insulin'
  end

  def to_tr padding: 0
    super padding: padding
  end

  def cells
    super.push meds_cell
  end

  def units
    {
      full: 'Insulin units',
      short: 'u'
    }
  end
end
