describe GlucoseMeasurement, type: :model do
  let(:bg) { build :glucose_measurement }
  
  it 'knows what its presenter is' do
    expect(bg.presenter).to be_a GlucoseMeasurementPresenter
  end
end
