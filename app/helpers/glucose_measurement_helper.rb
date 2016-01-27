module GlucoseMeasurementHelper
  def date_sift measurements
    h = {}
    measurements.sort_by { |m| m.datetime }.each do |m|
      date = m.datetime.strftime '%Y-%m-%d'
      begin
        h[date] << m
      rescue NoMethodError
        h[date] = [m]
      end
    end

    h
  end
end
