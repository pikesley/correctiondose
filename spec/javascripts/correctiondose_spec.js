describe('Slider', function() {
  describe('returns a period message', function() {
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
