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

function isBreakfastTime(time) {
  if(time >= '06:30' && time <= '11:00') {
    return true
  }
  return false
}

function classForBG(value, time) {
  if(isBreakfastTime(time) && value > 7) {
    return 'bg-high'
  }

  if(value > 8) {
    return 'bg-high'
  }

  if(value < 4.5) {
    return 'bg-low'
  }

  return 'bg-ok'
}
