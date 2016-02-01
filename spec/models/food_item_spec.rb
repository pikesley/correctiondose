describe FoodItem, type: :model do
  it 'has a valie factory' do
    expect(create :food_item).to be_valid
  end
end
