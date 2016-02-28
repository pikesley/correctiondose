module ControllerHelpers
  def with_year metrics
    begin
      metrics.first.datetime.year < Time.now.year
    rescue NoMethodError
      nil
    end
  end

  def no_picker metrics
    begin
      ((Time.now - metrics.first.datetime) / 3600) > 168
    rescue NoMethodError
      true
    end
  end

  def bucket metrics
    metrics.group_by { |g| g.datetime.strftime "%Y-%m-%d" }
  end
end
