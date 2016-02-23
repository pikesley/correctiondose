class GlucoseMeasurementPresenter < GenericPresenter
  def edit_cell
    super :edit_glucose_measurement_path
  end

  def measurement_cell
    cell value_div, 'glucose-measurement-value'
  end

  def number_span
    super :value
  end

  def value_div
    super :value
  end

  def to_tr padding: 0
    super padding: padding
  end

  def form_fields
    super.merge({
      value: {
        name: 'Value',
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
      full: 'millimoles per Litre',
      short: 'mmol/L'
    }
  end
end
