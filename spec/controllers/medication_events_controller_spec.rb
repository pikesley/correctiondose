describe MedicationEventsController, type: :controller do
  before :each do
    sign_in
  end

  describe 'GET #index' do
    it 'populates an array of medication events' do
      Timecop.freeze 2016, 01, 28, 20, 11 do
        medication_event = create(:medication_event, datetime: Time.now)
        get :index
        expect(assigns(:metrics)).to eq [medication_event]
        expect(assigns(:bucketed_metrics)['2016-01-28'].first).to eq medication_event
      end
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested meds event to @metric' do
      medication_event = create(:medication_event)
      get :show, id: medication_event
      expect(assigns(:metric)).to eq medication_event
    end

    it 'renders the #show view' do
      get :show, id: create(:medication_event)
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new measurement' do
        expect {
          post :create, medication_event: attributes_for(:medication_event)
        }.to change(MedicationEvent, :count).by 1
      end

      it 'redirects to the front page' do
        post :create, medication_event: attributes_for(:medication_event)
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new meds' do
        expect {
          post :create, medication_event: attributes_for(:invalid_medication_event)
        }.to_not change(MedicationEvent, :count)
      end

      it 're-renders the #new view' do
        post :create, medication_event: attributes_for(:invalid_medication_event)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    let (:test_meds) { create :medication_event, datetime: '1974-06-15 22:00:00', dose: 14.0, insulin: 'lantus' }

    context 'valid attributes' do
      it 'locates the requested event' do
        put :update, id: test_meds, medication_event: attributes_for(:medication_event)
        expect(assigns :metric).to eq test_meds
      end

      it 'changes test_meds` attributes' do
        put :update, id: test_meds,
                     medication_event: attributes_for(:medication_event,
                                                         datetime: '1975-06-15 22:00:00',
                                                         dose: 16,
                                                         insulin: 'lantus')
        test_meds.reload
        expect(test_meds.datetime).to eq '1975-06-15 22:00:00'
        expect(test_meds.dose).to eq 16.0
      end

      it 'redirects to the front page' do
        put :update, id: test_meds, medication_event: attributes_for(:medication_event)
        expect(assigns :metric).to eq test_meds
        expect(response).to redirect_to root_url
      end
    end

    context 'invalid attributes' do
      it 'locates the requested event' do
        put :update, id: test_meds, medication_event: attributes_for(:invalid_medication_event)
        expect(assigns(:metric)).to eq test_meds
      end

      it 'does not change the test_meds attributes' do
        put :update, id: test_meds,
                     medication_event: attributes_for(:medication_event,
                                                         datetime: nil,
                                                         dose: 4,
                                                         insulin: 'humalog')
        test_meds.reload
        expect(test_meds.dose).to_not eq 4
        expect(test_meds.datetime).to eq '1974-06-15 22:00:00'
      end

      it 're-renders the #edit view' do
        put :update, id: test_meds, medication_event: attributes_for(:invalid_medication_event)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let! (:test_meds) { create :medication_event }
    it 'deletes the event' do
      expect {
        delete :destroy, id: test_meds
      }.to change(MedicationEvent, :count).by -1
    end

    it 'redirects to #index' do
      delete :destroy, id: test_meds
      expect(response).to redirect_to root_url
    end
  end
end
