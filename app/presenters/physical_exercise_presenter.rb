class PhysicalExercisePresenter < MetricPresenter
  def description_cell
    cell metric.description, 'physical-exercise-description'
  end

  def form_fields
    super.merge({
      duration: {
        type: :number_field,
        input_attributes: {
          step: 1,
          min: 0,
          autofocus: 'autofocus'
        }
      },
      description: {
        type: :text_field
      }
    })
  end

  def cells
    super.push description_cell
  end

  def units
    {
      full: 'Minutes',
      short: 'mins'
    }
  end
end
