describe WelcomeController, type: :controller do
  it 'sanitises an hours param' do
    @hours = 36
    expect(described_class.new.send(:hours, 72)).to eq 72
    expect(described_class.new.send(:hours, 'foo')).to be nil
  end
end
