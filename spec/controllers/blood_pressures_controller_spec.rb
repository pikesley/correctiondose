describe BloodPressuresController, type: :controller do
  before :each do
    sign_in
  end

  describe 'GET #index' do
    it 'populates an array of bp values' do
      blood_pressure = create(:blood_pressure)
      get :index
      expect(assigns(:metrics)).to eq [blood_pressure]
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested hba1c value to @metric' do
      blood_pressure = create(:blood_pressure)
      get :show, id: blood_pressure
      expect(assigns(:metric)).to eq blood_pressure
    end

    it 'renders the #show view' do
      get :show, id: create(:blood_pressure)
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new hba1c' do
        expect {
          post :create, blood_pressure: attributes_for(:blood_pressure)
        }.to change(BloodPressure, :count).by 1
      end

      it 'redirects to the front page' do
        post :create, blood_pressure: attributes_for(:blood_pressure)
        # FIX THIS: Redirect to long_term_things_path
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new bp' do
        expect {
          post :create, blood_pressure: attributes_for(:invalid_blood_pressure)
        }.to_not change(BloodPressure, :count)
      end

      it 're-renders the #new view' do
        post :create, blood_pressure: attributes_for(:invalid_blood_pressure)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    let (:test_bp) { create :blood_pressure, datetime: '1974-06-15 22:00:00', reading: '90/20' }

    context 'valid attributes' do
      it 'locates the requested value' do
        put :update, id: test_bp, blood_pressure: attributes_for(:blood_pressure)
        expect(assigns :metric).to eq test_bp
      end

      it 'changes test_bp` attributes' do
        put :update, id: test_bp,
                     blood_pressure: attributes_for(:blood_pressure,
                                                         datetime: '1975-06-15 22:00:00',
                                                         reading: '130/80')
        test_bp.reload
        expect(test_bp.datetime).to eq '1975-06-15 22:00:00'
        expect(test_bp.reading).to eq '130/80'
      end

      it 'redirects to the front page' do
        put :update, id: test_bp, blood_pressure: attributes_for(:blood_pressure)
        expect(assigns :metric).to eq test_bp
        # FIX THIS: Redirect to long_term_things_path
        expect(response).to redirect_to root_url
      end
    end

    context 'invalid attributes' do
      it 'locates the requested value' do
        put :update, id: test_bp, blood_pressure: attributes_for(:invalid_blood_pressure)
        expect(assigns(:metric)).to eq test_bp
      end

      it 'does not change the test_bp attributes' do
        put :update, id: test_bp,
                     blood_pressure: attributes_for(:blood_pressure,
                                                         datetime: nil,
                                                         reading: '100/50')
        test_bp.reload
        expect(test_bp.reading).to_not eq '100/50'
        expect(test_bp.datetime).to eq '1974-06-15 22:00:00'
      end

      it 're-renders the #edit view' do
        put :update, id: test_bp, blood_pressure: attributes_for(:invalid_blood_pressure)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let! (:test_bp) { create :blood_pressure }
    it 'deletes the value' do
      expect {
        delete :destroy, id: test_bp
      }.to change(BloodPressure, :count).by -1
    end

    it 'redirects to #index' do
      delete :destroy, id: test_bp
      expect(response).to redirect_to root_url
    end
  end
end
