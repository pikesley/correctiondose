describe ControllerHelpers do
  describe 'date_sift' do
    let (:one) { create :glucose_measurement, datetime: '2016-01-28 12:00:00', value: 7.0 }
    let (:two) { create :glucose_measurement, datetime: '2016-01-27 13:00:00', value: 7.0 }
    let (:three) { create :glucose_measurement, datetime: '2016-01-27 12:00:00', value: 7.0 }
    let (:four) { create :glucose_measurement, datetime: '2016-01-29 12:00:00', value: 7.0 }
    let (:data) { [ one, two, three, four ]}
    it 'groups measurements by day' do
      expect(ControllerHelpers.date_sift data).to eq (
        {
          '2016-01-29' => [four],
          '2016-01-28' => [one],
          '2016-01-27' => [two, three]
        }
      )
    end
  end

  describe 'to_presenter' do
    let (:bg) { create :glucose_measurement }
    it 'returns a presenter' do
      expect(ControllerHelpers.to_presenter bg).to be_a GlucoseMeasurementPresenter
    end

    let (:bg_pres) { GlucoseMeasurementPresenter.new bg }
    it ' does nothing with an actual presenter' do
      expect(ControllerHelpers.to_presenter bg_pres).to be_a GlucoseMeasurementPresenter
    end
  end
end
