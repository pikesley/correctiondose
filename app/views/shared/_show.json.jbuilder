json.(@metric, :datetime)

@metric.class.fields.each do |field|
  json.(@metric, field.to_sym )
end
