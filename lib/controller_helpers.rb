module ControllerHelpers
  def self.date_sift measurements
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

  def self.to_presenter metric
    return metric if metric.class.name =~ /Presenter$/
    "#{metric.class.name}Presenter".constantize.new metric
  end

  def self.for_table metrics
    data = ControllerHelpers.date_sift metrics
    data.each_pair do |date, metrics|
      metrics.map! do |m|
        to_presenter m
      end
    end

    data
  end

  def self.widest data
    widest = 0
    data.each_pair do |k, v|
      v.each do |a|
        widest = a.width if a.width > widest
      end
    end
    widest
  end
end
