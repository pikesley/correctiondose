function period(hours, limit) {
  if(limit === undefined) {
    limit = 72
  }
  
  var string = (hours <= limit) ? hours + ' hrs' : Math.round(hours / 24) + ' days'
  return 'last ' + string
}
