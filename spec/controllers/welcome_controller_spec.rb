describe WelcomeController, type: :controller do
  let(:metrics) {
    [
      create(:glucose_measurement),
      create(:medication_event),
      create(:carbohydrate_intake),
      create(:physical_exercise)
    ]
  }
  it 'knows which metric has the most fields' do
    expect(described_class.new.send(:widest, metrics)).to eq 2
  end
end
