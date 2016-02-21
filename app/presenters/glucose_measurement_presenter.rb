require 'delegate'

class GlucoseMeasurementPresenter < SimpleDelegator
  def fancy_value
    @fancy_value ||= "The value is #{model.value}"
  end

  def model
    __getobj__
  end
end
