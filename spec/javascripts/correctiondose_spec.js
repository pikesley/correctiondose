describe('Slider', function() {
  describe('period()', function() {
    it('returns 24 hours', function() {
      expect(period(24)).toEqual('last 24 hrs')
    })

    it('returns 72 hours', function() {
      expect(period(72)).toEqual('last 72 hrs')
    })

    it('returns 3 days', function() {
      expect(period(73)).toEqual('last 3 days')
    })

    it('can take a different limit', function() {
      expect(period(24, 12)).toEqual('last 1 days')
    })
  })
})

describe ('ChartWrangler', function() {
  json = [{
    id: 1756,
    datetime: "2016-02-15T12:03:00.000Z",
    value: 6.6,
    created_at: "2016-02-15T12:03:58.365Z",
    updated_at: "2016-02-15T12:03:58.365Z"
  },
  {
    id: 1755,
    datetime: "2016-02-15T07:25:00.000Z",
    value: 5.5,
    created_at: "2016-02-15T07:25:30.545Z",
    updated_at: "2016-02-15T07:25:30.545Z"
  },
  {
    id: 1754,
    datetime: "2016-02-14T23:58:00.000Z",
    value: 7.7,
    created_at: "2016-02-14T23:58:14.206Z",
    updated_at: "2016-02-14T23:58:14.206Z"
  }]

  describe('mapPoints()', function() {
    it('extracts the datetimes', function() {
      expect(mapPoints(json, 'datetime')).toEqual(
        [
          '2016-02-15T12:03:00.000Z',
          '2016-02-15T07:25:00.000Z',
          '2016-02-14T23:58:00.000Z'
        ]
      )
    })
  })

  describe('fixTimeStamp()', function() {
    it('gives a timestamp Plotly can use', function() {
      expect(fixTimeStamp('2016-02-15T07:25:00.000Z')).toEqual(
        '2016-02-15 07:25:00'
      )
    })
  })

  describe('fixTimeStamps()', function() {
    it('fixes a list of timestamps', function() {
      expect(fixTimeStamps(
        [
          '2016-02-15T12:03:00.000Z',
          '2016-02-15T07:25:00.000Z',
          '2016-02-14T23:58:00.000Z'
        ]
      )).toEqual(
        [
          '2016-02-15 12:03:00',
          '2016-02-15 07:25:00',
          '2016-02-14 23:58:00'
        ]
      )
    })
  })

  describe('points()', function() {
    it('gets a set of points', function() {
      expect(points(json, 'value')).toEqual(
        {
          x: [
            '2016-02-15 12:03:00',
            '2016-02-15 07:25:00',
            '2016-02-14 23:58:00'
          ],
          y: [
            6.6,
            5.5,
            7.7
          ]
        }
      )
    })
  })
})

/*describe('isBreakfastTime()', function() {
  it('knows when it is breakfast-time', function() {
    expect(isBreakfastTime('08:00')).toEqual(true)
  })

  it('knows when it is not breakfast-time', function() {
    expect(isBreakfastTime('06:15')).toEqual(false)
    expect(isBreakfastTime('11:30')).toEqual(false)
  })
})

describe('classForBG()', function() {
  it('gives the class for a high reading', function() {
    expect(classForBG(9, '12:00')).toEqual('bg-high')
  })

  it('gives the class for a low reading', function() {
    expect(classForBG(4.1, '12:00')).toEqual('bg-low')
  })

  it('does nothing for an in-range reading', function() {
    expect(classForBG(6, '12:00')).toEqual('bg-ok')
  })

  it('knows that breakfast-time is a special case', function() {
    expect(classForBG(7.5, '07:30')).toEqual('bg-high')
  })
})*/
