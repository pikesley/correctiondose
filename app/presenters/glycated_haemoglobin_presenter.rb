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
    super padding: padding
  end

  def form_fields
    super.merge({
      percentage: {
        name: 'Percentage',
        type: :number_field,
        input_attributes: {
          step: 0.1,
          min: 0,
          autofocus: 'autofocus'
        }
      }
    })
  end

  def units
    {
      full: 'percent',
      short: '%'
    }
  end
end
