describe GlucoseMeasurementPresenter do
  before :each do
    DatabaseCleaner.clean
  end

  let(:bg) { create :glucose_measurement }
  let(:decorated_bg) { GlucoseMeasurementPresenter.new bg }

  it 'has an Edit cell' do
    expect(decorated_bg.edit_cell).to eq '<td><a title="Edit this measurement" href="/glucose/1/edit">21:42</a></td>'
  end

  it 'has a Label cell' do
    expect(decorated_bg.label_cell).to eq '<td>Glucose</td>'
  end

  it 'has a Number span' do
    expect(decorated_bg.number_span).to eq "<span class='number'>6.0</span>"
  end

  it 'has a Units span' do
    expect(decorated_bg.units_span).to eq "<span class='units'>mmol/L</span>"
  end

  it 'has a Value div' do
    expect(decorated_bg.value_div).to eq (
      "<div class='value' data-toggle='tooltip' data-placement='top' title='6.0 millimoles per Litre'><span class='number'>6.0</span> <span class='units'>mmol/L</span></div>"
    )
  end

  it 'has a Measurement cell' do
    expect(decorated_bg.measurement_cell).to eq "<td class='glucose-measurement-value'><div class='value' data-toggle='tooltip' data-placement='top' title='6.0 millimoles per Litre'><span class='number'>6.0</span> <span class='units'>mmol/L</span></div></td>"
  end

  it 'presents as a whole table row' do
    expect(decorated_bg.to_tr).to eq (
      "<tr><td><a title=\"Edit this measurement\" href=\"/glucose/1/edit\">21:42</a></td><td>Glucose</td><td class='glucose-measurement-value'><div class='value' data-toggle='tooltip' data-placement='top' title='6.0 millimoles per Litre'><span class='number'>6.0</span> <span class='units'>mmol/L</span></div></td></tr>"
    )
  end

  it 'pads the row if required' do
    expect(decorated_bg.to_tr padding: 1).to eq (
      "<tr><td><a title=\"Edit this measurement\" href=\"/glucose/1/edit\">21:42</a></td><td>Glucose</td><td class='glucose-measurement-value'><div class='value' data-toggle='tooltip' data-placement='top' title='6.0 millimoles per Litre'><span class='number'>6.0</span> <span class='units'>mmol/L</span></div></td><td class='filler'></td></tr>"
    )
  end
end
