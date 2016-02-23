module ApplicationHelper
  def models
    [
      GlucoseMeasurement,
      MedicationEvent,
      CarbohydrateIntake,
      PhysicalExercise
    ]
  end

  def longterms
    [
      GlycatedHaemoglobin,
      BloodPressure
    ]
  end

  def class_name instance
    begin
      return instance.name.constantize
    rescue Exception => e
      return instance.class.name.constantize if e.message.match /undefined method `name' for/
    end
  end

  def class_for_table_cell metric, field
    "#{class_name(metric).name.underscore.gsub('_', '-')}-#{field}"
  end

  def new_path model
    "new_#{class_name(model).name.underscore}_path".to_sym
  end

  def model_path model
    "#{class_name(model).name.underscore}_path".to_sym
  end

  def edit_path model
    "edit_#{class_name(model).name.underscore}_path".to_sym
  end

  def button_name model
    "btn-#{param_name model}"
  end

  def param_name model
    class_name(model).short_name.downcase.gsub(' ', '-')
  end
end
