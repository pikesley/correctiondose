class CarbohydrateIntakePresenter < GenericPresenter
  def edit_cell
    cell(link_to model.datetime.strftime('%H:%M'),
    url_helpers.edit_carbohydrate_intake_path(model),
    title: 'Edit carbs')
  end

  def measurement_cell
    cell value_div, 'carbohydrate-intake-weight'
  end

  def number_span
    super :weight
  end

  def value_div
    super :weight
  end

  def description_cell
    cell model.description, 'carbohydrate-intake-description'
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
      full: 'grams',
      short: 'g'
    }
  end
end
