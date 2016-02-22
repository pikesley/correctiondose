describe CarbohydrateIntakePresenter do
  before :each do
    DatabaseCleaner.clean
  end

  let(:carbs) { create :carbohydrate_intake }
  let(:decorated_carbs) { CarbohydrateIntakePresenter.new carbs }

  it 'presents as a whole table row' do
    expect(decorated_carbs.to_tr).to eq (
      "<tr><td><a title=\"Edit carbs\" href=\"/carbs/1/edit\">21:25</a></td><td>Carbs</td><td class='carbohydrate-intake-weight'><div class='value' data-toggle='tooltip' data-placement='top' title='70.0 grams'><span class='number'>70.0</span> <span class='units'>g</span></div></td><td class='carbohydrate-intake-description'>pasta bolognese</td></tr>"
    )
  end
end
