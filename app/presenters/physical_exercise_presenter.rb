class PhysicalExercisePresenter < GenericPresenter
  def edit_cell
    super :edit_physical_exercise_path
  end

  def measurement_cell
    cell value_div, 'physical-exercise-duration'
  end

  def number_span
    super :duration
  end

  def value_div
    super :duration
  end

  def description_cell
    cell model.description, 'physical-exercise-description'
  end

  def form_fields
    super.merge({
      duration: {
        name: 'Duration',
        type: :number_field,
        input_attributes: {
          step: 1,
          min: 0,
          autofocus: 'autofocus'
        }
      },
      description: {
        name: 'Description',
        type: :text_field
      }
    })
  end

  def to_tr padding: 0
    super padding: padding
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
