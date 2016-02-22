class GlucoseMeasurementPresenter < GenericPresenter
  def edit_cell
    cell(link_to model.datetime.strftime('%H:%M'),
    url_helpers.edit_glucose_measurement_path(model),
    title: 'Edit this measurement')
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

  def measurement_cell
    cell value_div, 'glucose-measurement-value'
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
      full: 'millimoles per Litre',
      short: 'mmol/L'
    }
  end
end
