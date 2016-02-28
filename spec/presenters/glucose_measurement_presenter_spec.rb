describe GlucoseMeasurementPresenter do
  before :each do
    DatabaseCleaner.clean
  end

  context 'table row' do
    let(:bg) { create :glucose_measurement }
    let(:decorated_bg) { GlucoseMeasurementPresenter.new bg }

    it 'has an Edit cell' do
      expect(decorated_bg.edit_cell).to eq '<td><a title="Edit Glucose" href="/glucose/1/edit">21:42</a></td>'
    end

    it 'has a Label cell' do
      expect(decorated_bg.label_cell).to eq '<td>Glucose</td>'
    end

    it 'has a Number span' do
      expect(decorated_bg.number_span).to eq "<span class='number'>6</span>"
    end

    it 'has a Units span' do
      expect(decorated_bg.units_span).to eq "<span class='units'>mmol/L</span>"
    end

    it 'has a Value div' do
      expect(decorated_bg.value_div).to eq (
        "<div class='value' data-toggle='tooltip' data-placement='top' title='6.0 millimoles per Litre'><span class='number'>6</span> <span class='units'>mmol/L</span></div>"
      )
    end

    it 'has a Measurement cell' do
      expect(decorated_bg.measurement_cell).to eq "<td class='glucose-measurement-value'><div class='value' data-toggle='tooltip' data-placement='top' title='6.0 millimoles per Litre'><span class='number'>6</span> <span class='units'>mmol/L</span></div></td>"
    end

    it 'presents as a whole table row' do
      expect(decorated_bg.to_tr).to eq (
        "<tr class='glucose-measurement'><td><a title=\"Edit Glucose\" href=\"/glucose/1/edit\">21:42</a></td><td>Glucose</td><td class='glucose-measurement-value'><div class='value' data-toggle='tooltip' data-placement='top' title='6.0 millimoles per Litre'><span class='number'>6</span> <span class='units'>mmol/L</span></div></td></tr>"
      )
    end

    it 'pads the row if required' do
      expect(decorated_bg.to_tr padding: 1).to eq (
        "<tr class='glucose-measurement'><td><a title=\"Edit Glucose\" href=\"/glucose/1/edit\">21:42</a></td><td>Glucose</td><td class='glucose-measurement-value'><div class='value' data-toggle='tooltip' data-placement='top' title='6.0 millimoles per Litre'><span class='number'>6</span> <span class='units'>mmol/L</span></div></td><td class='filler'></td></tr>"
      )
    end
  end

  context 'out-of-range BG' do
    let(:high_bg) { create :glucose_measurement, value: 19 }
    let(:decorated_high_bg) { GlucoseMeasurementPresenter.new high_bg }

    it 'knows if BG is high' do
      expect(decorated_high_bg.highlight_class).to eq 'bg-high'
    end

    let(:low_bg) { create :glucose_measurement, value: 3 }
    let(:decorated_low_bg) { GlucoseMeasurementPresenter.new low_bg }

    it 'knows if BG is low' do
      expect(decorated_low_bg.highlight_class).to eq 'bg-low'
    end

    it 'has the correct css class for a high BG' do
      expect(decorated_high_bg.measurement_cell).to match /<td class='glucose-measurement-value bg-high'>/
    end

    let(:high_am_bg) { create :glucose_measurement, value: 7.5, datetime: '2016-01-26 07:15:29' }
    let(:decorated_high_am_bg) { GlucoseMeasurementPresenter.new high_am_bg }
    it 'knows the limits are different in the morning' do
      expect(decorated_high_am_bg.measurement_cell).to match /<td class='glucose-measurement-value bg-high'>/
    end
  end

  context 'wrapped model' do
    let(:bg) { create :glucose_measurement }
    let(:decorated_bg) { GlucoseMeasurementPresenter.new bg }

    it 'exposes stuff about the wrapped model' do
      expect(decorated_bg.model_name).to eq 'GlucoseMeasurement'
      expect(decorated_bg.underscore).to eq 'glucose_measurement'
      expect(decorated_bg.url_friendly).to eq 'glucose-measurement'
      expect(decorated_bg.short_name).to eq 'Glucose'
    end
  end

  describe '#button_name' do
    let(:bg) { create :glucose_measurement }
    let(:decorated_bg) { GlucoseMeasurementPresenter.new bg }
    it 'generates the button name for the model' do
      expect(decorated_bg.button_name).to eq 'btn-glucose'
    end
  end
end
