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
    "<span class='number'>#{model.value}</span>"
  end
  
  def to_tr padding: 0
    s = "<tr>#{edit_cell}#{label_cell}#{measurement_cell}"

    padding.times do
      s += filler_cell
    end

    s += "</tr>"

    s
  end

  def units
    {
      full: 'millimoles per Litre',
      short: 'mmol/L'
    }
  end
end
