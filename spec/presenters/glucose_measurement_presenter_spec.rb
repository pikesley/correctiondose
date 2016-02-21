describe GlucoseMeasurementPresenter do
  let(:bg) { create :glucose_measurement }
  let(:decorated_bg) { GlucoseMeasurementPresenter.new bg }

  it 'gives the correct value' do
    expect(decorated_bg.fancy_value).to eq 'The value is 6.0'
  end
end
