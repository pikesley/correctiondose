function period(hours, limit) {
  if(limit === undefined) {
    limit = 72
  }

  var string = (hours <= limit) ? hours + ' hrs' : Math.round(hours / 24) + ' days'
  return 'last ' + string
}

function mapPoints(json, axis) {
  return json.map(function(item) { return item[axis] })
}

function fixTimeStamp(ts) {
  return ts.replace('T', ' ').replace('.000Z', '')
}

function fixTimeStamps(list) {
  return list.map(function(ts) { return fixTimeStamp(ts) })
}

function points(json, y_field) {
  return {
    x: fixTimeStamps(mapPoints(json, 'datetime')),
    y: mapPoints(json, y_field)
  }
}
