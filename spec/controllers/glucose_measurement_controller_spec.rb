describe GlucoseMeasurementController, type: :controller do
  before :each do
    sign_in
  end

  describe 'GET #index' do
    it 'populates an array of measurements' do
      measurement = FactoryGirl.create(:glucose_measurement)
      get :index
      expect(assigns(:measurements)).to eq [measurement]
    end
  end
end
