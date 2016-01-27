describe GlucoseMeasurementsController, type: :controller do
  before :each do
    sign_in
  end

  describe 'GET #index' do
    it 'populates an array of measurements' do
      glucose_measurement = create(:glucose_measurement)
      get :index
      expect(assigns(:glucose_measurements)).to eq [glucose_measurement]
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested measurement to @glucose_measurement' do
      glucose_measurement = create(:glucose_measurement)
      get :show, id: glucose_measurement
      expect(assigns(:glucose_measurement)).to eq glucose_measurement
    end

    it 'renders the #show view' do
      get :show, id: create(:glucose_measurement)
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new measurement' do
        expect {
          post :create, glucose_measurement: attributes_for(:glucose_measurement)
        }.to change(GlucoseMeasurement, :count).by 1
      end

      it 'redirects to the new measurement' do
        post :create, glucose_measurement: attributes_for(:glucose_measurement)
        expect(response).to redirect_to GlucoseMeasurement.last
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new contact' do
        expect {
          post :create, glucose_measurement: attributes_for(:invalid_glucose_measurement)
        }.to_not change(GlucoseMeasurement, :count)
      end

      it 're-renders the #new view' do
        post :create, glucose_measurement: attributes_for(:invalid_glucose_measurement)
        expect(response).to render_template :new
      end
    end
  end
end
