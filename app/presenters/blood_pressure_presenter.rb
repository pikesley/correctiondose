class BloodPressurePresenter < MetricPresenter
  def form_fields
    super.merge({
      reading: {
        type: :text_field,
        input_attributes: {
          autofocus: 'autofocus'
        }
      }
    })
  end

  def units
    {
      full: 'Systolic/Diastolic',
      short: 'mmHg'
    }
  end
end
