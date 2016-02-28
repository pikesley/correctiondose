describe ModelPresenter do
  before :each do
    DatabaseCleaner.clean
  end

  describe '#as_add_button' do
    let(:mp) { GlucoseMeasurement.model_presenter }
    it 'generates an add_new button' do
      expect(mp.as_add_button).to eq '<a class="btn btn-glucose-measurement" href="/glucose/new">Add Glucose</a>'
    end
  end
end
