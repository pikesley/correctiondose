class PhysicalExercisePresenter < GenericPresenter
  def edit_cell
    cell(link_to model.datetime.strftime('%H:%M'),
    url_helpers.edit_physical_exercise_path(model),
    title: 'Edit exercise')
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

  def to_tr padding: 0
    super [
      edit_cell,
      label_cell,
      measurement_cell,
      description_cell
    ]
  end

  def units
    {
      full: 'Minutes',
      short: 'mins'
    }
  end
end
