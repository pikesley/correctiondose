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

  describe 'for_table' do
    let (:one) { create :glucose_measurement, datetime: '2016-01-28 12:00:00', value: 7.0 }
    let (:two) { create :medication_event, datetime: '2016-01-27 13:00:00', dose: 7.0 }
    let (:three) { create :glucose_measurement, datetime: '2016-01-27 12:00:00', value: 7.0 }
    let (:four) { create :glucose_measurement, datetime: '2016-01-29 12:00:00', value: 7.0 }
    let (:data) { [ one, two, three, four ]}

    it 'prepares data for a table' do
      expect(ControllerHelpers.for_table data).to be_a Hash
      expect(ControllerHelpers.for_table(data).keys.first).to eq '2016-01-29'
    end
  end

  describe 'widest' do
    let (:one) { create :glucose_measurement, datetime: '2016-01-28 12:00:00', value: 7.0 }
    let (:two) { create :medication_event, datetime: '2016-01-27 13:00:00', dose: 7.0 }
    let (:three) { create :glucose_measurement, datetime: '2016-01-27 12:00:00', value: 7.0 }
    let (:four) { create :glucose_measurement, datetime: '2016-01-29 12:00:00', value: 7.0 }
    let (:data) { [ one, two, three, four ]}
    let (:tableised) { ControllerHelpers.for_table data }

    it 'knows which row is widest' do
      expect(ControllerHelpers.widest tableised).to eq 4
    end
  end
end
