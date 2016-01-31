describe CarbohydrateIntakesController, type: :controller do
  before :each do
    sign_in
  end

  describe 'GET #index' do
    it 'populates an array of measurements' do
      carbohydrate_intake = create(:carbohydrate_intake)
      get :index
      expect(assigns(:metrics)).to eq [carbohydrate_intake]
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested measurement to @metric' do
      carbohydrate_intake = create(:carbohydrate_intake)
      get :show, id: carbohydrate_intake
      expect(assigns(:metric)).to eq carbohydrate_intake
    end

    it 'renders the #show view' do
      get :show, id: create(:carbohydrate_intake)
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new measurement' do
        expect {
          post :create, carbohydrate_intake: attributes_for(:carbohydrate_intake)
        }.to change(CarbohydrateIntake, :count).by 1
      end

      it 'redirects to the front page' do
        post :create, carbohydrate_intake: attributes_for(:carbohydrate_intake)
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new carbs' do
        expect {
          post :create, carbohydrate_intake: attributes_for(:invalid_carbohydrate_intake)
        }.to_not change(CarbohydrateIntake, :count)
      end

      it 're-renders the #new view' do
        post :create, carbohydrate_intake: attributes_for(:invalid_carbohydrate_intake)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    let (:test_carbs) { create :carbohydrate_intake, datetime: '1974-06-15 12:00:00', weight: 50.0 }

    context 'valid attributes' do
      it 'locates the requested measurement' do
        put :update, id: test_carbs, carbohydrate_intake: attributes_for(:carbohydrate_intake)
        expect(assigns :metric).to eq test_carbs
      end

      it 'changes test_carbs` attributes' do
        put :update, id: test_carbs,
                     carbohydrate_intake: attributes_for(:carbohydrate_intake,
                                                         datetime: '1975-06-15 13:00:00',
                                                         weight: 65)
        test_carbs.reload
        expect(test_carbs.datetime).to eq '1975-06-15 13:00:00'
        expect(test_carbs.weight).to eq 65
      end

      it 'redirects to the front page' do
        put :update, id: test_carbs, carbohydrate_intake: attributes_for(:glucose_measurement)
        expect(assigns :metric).to eq test_carbs
        expect(response).to redirect_to root_url
      end
    end

    context 'invalid attributes' do
      it 'locates the requested measurement' do
        put :update, id: test_carbs, carbohydrate_intake: attributes_for(:invalid_carbohydrate_intake)
        expect(assigns(:metric)).to eq test_carbs
      end

      it 'does not change the test_carbs attributes' do
        put :update, id: test_carbs,
                     carbohydrate_intake: attributes_for(:carbohydrate_intake,
                                                         datetime: nil,
                                                         weight: 40)
        test_carbs.reload
        expect(test_carbs.weight).to_not eq 40
        expect(test_carbs.datetime).to eq '1974-06-15 12:00:00'
      end

      it 're-renders the #edit view' do
        put :update, id: test_carbs, carbohydrate_intake: attributes_for(:invalid_carbohydrate_intake)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let! (:test_carbs) { create :carbohydrate_intake }
    it 'deletes the carbs' do
      expect {
        delete :destroy, id: test_carbs
      }.to change(CarbohydrateIntake, :count).by -1
    end

    it 'redirects to #index' do
      delete :destroy, id: test_carbs
      expect(response).to redirect_to root_url
    end
  end
end
