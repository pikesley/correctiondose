describe GlucoseMeasurementHelper do
  describe '#date_sifter' do
    let (:one) { create :glucose_measurement, datetime: '2016-01-28 12:00:00', value: 7.0 }
    let (:two) { create :glucose_measurement, datetime: '2016-01-27 13:00:00', value: 7.0 }
    let (:three) { create :glucose_measurement, datetime: '2016-01-27 12:00:00', value: 7.0 }
    let (:data) { [ one, two, three ]}
    it 'groups measurements by day' do
      expect(helper.date_sift data).to eq (
        {
          '2016-01-27' => [three, two],
          '2016-01-28' => [one]
        }
      )
    end
  end
end
