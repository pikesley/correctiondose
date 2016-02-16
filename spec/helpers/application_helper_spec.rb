describe ApplicationHelper do
  describe '#date_sifter' do
    let (:one) { create :glucose_measurement, datetime: '2016-01-28 12:00:00', value: 7.0 }
    let (:two) { create :glucose_measurement, datetime: '2016-01-27 13:00:00', value: 7.0 }
    let (:three) { create :glucose_measurement, datetime: '2016-01-27 12:00:00', value: 7.0 }
    let (:four) { create :glucose_measurement, datetime: '2016-01-29 12:00:00', value: 7.0 }
    let (:data) { [ one, two, three, four ]}
    it 'groups measurements by day' do
      expect(helper.date_sift data).to eq (
        {
          '2016-01-29' => [four],
          '2016-01-28' => [one],
          '2016-01-27' => [two, three]
        }
      )
    end
  end

  describe '#get_type' do
    let (:metric) { create :medication_event }
    it 'knows dose is a :float' do
      expect(helper.get_type metric, 'dose').to eq :float
    end

    it 'knows insulin is a :string' do
      expect(helper.get_type metric, 'insulin').to eq :string
    end
  end

  describe '#insulin_for_time' do
    it 'defaults to humalog' do
      Timecop.freeze 2016, 02, 16, 12, 00
      expect(helper.insulin_for_time).to eq 'humalog'
      Timecop.return
    end
    
    it 'knows lantus is for bedtime' do
      Timecop.freeze 2016, 02, 16, 22, 00
        expect(helper.insulin_for_time).to eq 'lantus'
      Timecop.return
    end

    it 'thinks bedtime lasts until 06:00' do
      Timecop.freeze 2016, 02, 16, 06, 00
      expect(helper.insulin_for_time).to eq 'lantus'
      Timecop.return
    end
  end
end
