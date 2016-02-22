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
    expect(described_class.new.send(:widest, metrics)).to eq 4
  end

  it 'sanitises an hours param' do
    @hours = 36
    expect(described_class.new.send(:hours, 72)).to eq 72
    expect(described_class.new.send(:hours, 'foo')).to be nil
  end
end
