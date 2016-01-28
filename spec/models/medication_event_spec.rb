describe MedicationEvent, type: :model do
  it 'has a valid factory' do
    expect(create :medication_event).to be_valid
  end

  it 'is invalid with an unknown type' do
    expect(build :medication_event, insulin: 'snakeoil').to_not be_valid
  end
end
