json.ignore_nil!

json.(@metric, :id)
json.(@metric, :datetime)

@metric.presenter.fields.each do |field|
  json.(@metric, field.to_sym )
end
