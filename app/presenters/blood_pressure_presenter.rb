class BloodPressurePresenter < GenericPresenter
  def edit_cell
    super :edit_blood_pressure_path
  end

  def measurement_cell
    cell value_div, 'blood-pressure-reading'
  end

  def number_span
    super :reading
  end

  def value_div
    super :reading
  end

  def to_tr padding: 0
    super padding: padding
  end

  def units
    {
      full: 'Systolic/Diastolic',
      short: 'mmHg'
    }
  end
end
