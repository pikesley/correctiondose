class GlucoseMeasurementPresenter < MetricPresenter
  def measurement_cell
    super highlight_class
  end

  def form_fields
    super.merge({
      value: {
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
    return true if metric.value > 7 && is_morning
    return true if metric.value > 8
    false
  end

  def is_low
    return true if metric.value < 4.5
    false
  end

  def is_morning
    time = metric.datetime.strftime '%H:%M'
    time > '06:30' && time < '11:00'
  end
end
