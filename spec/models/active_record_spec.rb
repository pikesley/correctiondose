describe GlucoseMeasurement, type: :model do
  it 'knows what its presenter is' do
    expect(described_class.presenter).to eq GlucoseMeasurementPresenter
  end
end
