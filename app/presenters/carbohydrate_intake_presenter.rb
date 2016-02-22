class CarbohydrateIntakePresenter < GenericPresenter
  def edit_cell
    super :edit_carbohydrate_intake_path
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
    super padding: padding
  end

  def cells
    super.push description_cell
  end

  def units
    {
      full: 'grams',
      short: 'g'
    }
  end
end
