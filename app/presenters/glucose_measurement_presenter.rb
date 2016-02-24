class GlucoseMeasurementPresenter < GenericPresenter
  def edit_cell
    super :edit_glucose_measurement_path
  end

  def measurement_cell
    cell value_div, ['glucose-measurement-value', highlight_class]
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

  def highlight_class
    return 'bg-high' if is_high
    return 'bg-low' if is_low
  end

  def is_high
    return true if model.value > 7 && is_morning
    return true if model.value > 8
    false
  end

  def is_low
    return true if model.value < 4.5
    false
  end

  def is_morning
    time = model.datetime.strftime '%H:%M'
    time > '06:30' && time < '11:00'
  end
end
