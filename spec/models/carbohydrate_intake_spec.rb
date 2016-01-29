describe CarbohydrateIntake, type: :model do
  it 'has a valid factory' do
    expect(create :carbohydrate_intake).to be_valid
  end

  it 'is invalid with a weight less than zero' do
    expect(build :carbohydrate_intake, weight: -10).to_not be_valid
  end
end
