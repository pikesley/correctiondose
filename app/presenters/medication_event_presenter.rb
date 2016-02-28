class MedicationEventPresenter < MetricPresenter
  def meds_cell
    cell metric.insulin, 'medication-event-insulin'
  end

  def form_fields
    super.merge({
      dose: {
        type: :number_field,
        input_attributes: {
          step: 0.5,
          min: 0,
          value: 10,
          autofocus: 'autofocus'
        }
      },
      insulin: {
        type: :select,
        options_for_select: {
          choices: metric.class.insulin_types,
          default: insulin_for_time
        }
      }
    })
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
