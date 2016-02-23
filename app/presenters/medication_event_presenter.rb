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

  def form_fields
    super.merge({
      dose: {
        name: 'Dose',
        type: :number_field,
        input_attributes: {
          step: 0.5,
          min: 0,
          autofocus: 'autofocus'
        }
      },
      insulin: {
        name: 'Insulin',
        type: :select,
        options_for_select: {
          choices: model.class.insulin_types,
          default: insulin_for_time
        }
      }
    })
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

  def insulin_for_time
    nighttime? ? 'lantus' : 'humalog'
  end

  def nighttime?
    bedtime = 22
    morning = 06

    Time.now.hour >= bedtime || Time.now.hour <= morning
  end
end
