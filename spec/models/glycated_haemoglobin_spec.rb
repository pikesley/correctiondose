describe GlycatedHaemoglobin, type: :model do
  it 'has a valid factory' do
    expect(create :glycated_haemoglobin).to be_valid
  end

  it 'is invalid with an negative value' do
    expect(build :glycated_haemoglobin, percentage: -10).to_not be_valid
  end
end
