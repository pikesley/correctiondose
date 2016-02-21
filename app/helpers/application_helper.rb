module ApplicationHelper
  def date_sift measurements
    h = {}
    measurements.sort_by { |m| m.datetime }.reverse.each do |m|
      date = m.datetime.strftime '%Y-%m-%d'
      begin
        h[date] << m
      rescue NoMethodError
        h[date] = [m]
      end
    end

    h
  end

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

  def get_type metric, field
    metric.class.columns.map { |m|
      {
        m.name => m.type
      }
    }.select { |p|
      p.keys[0] == field
    }[0].values[0]
  end

  def intervals
    [ 36, 48, 72]
  end

  def insulin_for_time
    nighttime? ? 'lantus' : 'humalog'
  end

  def nighttime?
    bedtime = 22
    morning = 06

    Time.now.hour >= bedtime || Time.now.hour <= morning
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
