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

  describe 'PUT #update' do
    let (:test_measurement) { create :glucose_measurement, datetime: '1974-06-15 12:00:00', value: 7.0}

    context 'valid attributes' do
      it 'locates the requested measurement' do
        put :update, id: test_measurement, glucose_measurement: attributes_for(:glucose_measurement)
        expect(assigns :glucose_measurement).to eq test_measurement
      end

      it 'changes test_measurement`s attributes' do
        put :update, id: test_measurement,
                     glucose_measurement: attributes_for(:glucose_measurement,
                                                         datetime: '1975-06-15 13:00:00',
                                                         value: 12)
        test_measurement.reload
        expect(test_measurement.datetime).to eq '1975-06-15 13:00:00'
        expect(test_measurement.value).to eq 12.0
      end

      it 'redirects to the updated measurement' do
        put :update, id: test_measurement, glucose_measurement: attributes_for(:invalid_glucose_measurement)
        expect(assigns :glucose_measurement).to eq test_measurement
      end
    end

    context 'invalid attributes' do
      it 'locates the requested measurement' do
        put :update, id: test_measurement, glucose_measurement: attributes_for(:invalid_glucose_measurement)
        expect(assigns(:glucose_measurement)).to eq test_measurement
      end

      it 'does not change the test_measurement attributes' do
        put :update, id: test_measurement,
                     glucose_measurement: attributes_for(:glucose_measurement,
                                                         datetime: nil,
                                                         value: 4)
        test_measurement.reload
        expect(test_measurement.value).to_not eq 4
        expect(test_measurement.datetime).to eq '1974-06-15 12:00:00'
      end

      it 're-renders the #edit view' do
        put :update, id: test_measurement, glucose_measurement: attributes_for(:invalid_glucose_measurement)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let! (:test_measurement) { create :glucose_measurement }

    it 'deletes the measurement' do
      expect {
        delete :destroy, id: test_measurement
      }.to change(GlucoseMeasurement, :count).by -1
    end

    it 'redirects to #index' do
      delete :destroy, id: test_measurement
      expect(response).to redirect_to glucose_measurements_url
    end
  end
end
