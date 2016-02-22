class MedicationEventPresenter < GenericPresenter
  def edit_cell
    cell(link_to model.datetime.strftime('%H:%M'),
    url_helpers.edit_medication_event_path(model),
    title: 'Edit this meds')
  end

  def measurement_cell
    cell value_div, 'glucose-measurement-value'
  end

  def number_span
    "<span class='number'>#{model.dose}</span>"
  end

  def value_div
    "<div class='value' data-toggle='tooltip' data-placement='top' title='#{model.dose} #{units[:full]}'>#{number_span} #{units_span}</div>"
  end

  def measurement_cell
    cell value_div, 'medication-event-dose'
  end

  def meds_cell
    cell model.insulin, 'medication-event-insulin'
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
      full: 'Insulin units',
      short: 'u'
    }
  end
end
