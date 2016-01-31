json.ignore_nil!
json.array! @metrics do |metric|
  json.id metric.id
  json.datetime metric.datetime
  metric.class.fields.each do |field|
    json.(metric, field.to_sym )
  end
  json.url send("#{class_name(metric).name.underscore}_url".to_sym, metric.id) + '.json'
end
