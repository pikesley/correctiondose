describe GlucoseMeasurement, type: :model do
  it 'has a valid factory' do
    expect(create :glucose_measurement).to be_valid
  end

  it 'is invalid with a value less than zero' do
    expect(build :glucose_measurement, value: -1).to_not be_valid
  end
end
