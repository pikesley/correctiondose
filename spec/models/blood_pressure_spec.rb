describe BloodPressure, type: :model do
  it 'has a valid factory' do
    expect(create :blood_pressure).to be_valid
  end

  it 'is invalid with a duff string' do
    expect(build :blood_pressure, reading: '12').to_not be_valid
  end
end
