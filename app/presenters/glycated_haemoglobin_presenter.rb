class GlycatedHaemoglobinPresenter < GenericPresenter
  def edit_cell
    super :edit_glycated_haemoglobin_path
  end

  def measurement_cell
    cell value_div, 'glycated-haemoglobin-percentage'
  end

  def number_span
    super :percentage
  end

  def value_div
    super :percentage, space: false
  end

  def to_tr padding: 0
    super [
      edit_cell,
      label_cell,
      measurement_cell
    ], padding: padding
  end

  def units
    {
      full: 'percent',
      short: '%'
    }
  end
end
