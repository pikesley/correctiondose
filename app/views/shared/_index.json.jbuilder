json.ignore_nil!
json.array! @metrics[0..100] do |metric|
  json.id metric.id
  json.datetime metric.datetime
  metric.class.fields.each do |field|
    json.(metric, field.to_sym )
  end
  json.url send(model_path(metric), metric.id) + '.json'
end
