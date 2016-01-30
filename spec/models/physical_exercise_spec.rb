describe PhysicalExercise, type: :model do
  it 'has a valid factory' do
    expect(create :physical_exercise).to be_valid
  end

  it 'is invalid with an unknown type' do
    expect(build :physical_exercise, duration: 0).to_not be_valid
  end
end
