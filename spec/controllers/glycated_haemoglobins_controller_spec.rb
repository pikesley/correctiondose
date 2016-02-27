describe GlycatedHaemoglobinsController, type: :controller do
  before :each do
    sign_in
  end

  describe 'GET #index' do
    it 'populates an array of hba1c values' do
      Timecop.freeze 2016, 02, 20, 18, 11 do
        glycated_haemoglobin = create(:glycated_haemoglobin)
        get :index
        expect(assigns(:metrics).first[1]).to eq [glycated_haemoglobin]
      end
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested hba1c value to @metric' do
      glycated_haemoglobin = create(:glycated_haemoglobin)
      get :show, id: glycated_haemoglobin
      expect(assigns(:metric)).to eq glycated_haemoglobin
    end

    it 'renders the #show view' do
      get :show, id: create(:glycated_haemoglobin)
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new hba1c' do
        expect {
          post :create, glycated_haemoglobin: attributes_for(:glycated_haemoglobin)
        }.to change(GlycatedHaemoglobin, :count).by 1
      end

      it 'redirects to the front page' do
        post :create, glycated_haemoglobin: attributes_for(:glycated_haemoglobin)
        expect(response).to redirect_to longterm_index_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new meds' do
        expect {
          post :create, glycated_haemoglobin: attributes_for(:invalid_glycated_haemoglobin)
        }.to_not change(GlycatedHaemoglobin, :count)
      end

      it 're-renders the #new view' do
        post :create, glycated_haemoglobin: attributes_for(:invalid_glycated_haemoglobin)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    let (:test_hba1c) { create :glycated_haemoglobin, datetime: '1974-06-15 22:00:00', percentage: 14.0 }

    context 'valid attributes' do
      it 'locates the requested value' do
        put :update, id: test_hba1c, glycated_haemoglobin: attributes_for(:glycated_haemoglobin)
        expect(assigns :metric).to eq test_hba1c
      end

      it 'changes test_hba1c` attributes' do
        put :update, id: test_hba1c,
                     glycated_haemoglobin: attributes_for(:glycated_haemoglobin,
                                                         datetime: '1975-06-15 22:00:00',
                                                         percentage: 19)
        test_hba1c.reload
        expect(test_hba1c.datetime).to eq '1975-06-15 22:00:00'
        expect(test_hba1c.percentage).to eq 19.0
      end

      it 'redirects to the front page' do
        put :update, id: test_hba1c, glycated_haemoglobin: attributes_for(:glycated_haemoglobin)
        expect(assigns :metric).to eq test_hba1c
        expect(response).to redirect_to longterm_index_path
      end
    end

    context 'invalid attributes' do
      it 'locates the requested value' do
        put :update, id: test_hba1c, glycated_haemoglobin: attributes_for(:invalid_glycated_haemoglobin)
        expect(assigns(:metric)).to eq test_hba1c
      end

      it 'does not change the test_hba1c attributes' do
        put :update, id: test_hba1c,
                     glycated_haemoglobin: attributes_for(:glycated_haemoglobin,
                                                         datetime: nil,
                                                         percentage: 4)
        test_hba1c.reload
        expect(test_hba1c.percentage).to_not eq 4
        expect(test_hba1c.datetime).to eq '1974-06-15 22:00:00'
      end

      it 're-renders the #edit view' do
        put :update, id: test_hba1c, glycated_haemoglobin: attributes_for(:invalid_glycated_haemoglobin)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let! (:test_hba1c) { create :glycated_haemoglobin }
    it 'deletes the value' do
      expect {
        delete :destroy, id: test_hba1c
      }.to change(GlycatedHaemoglobin, :count).by -1
    end

    it 'redirects to #index' do
      delete :destroy, id: test_hba1c
      expect(response).to redirect_to root_url
    end
  end

#  describe '#GET JSON' do
#    it 'shows some JSON' do
#      Timecop.freeze 2016, 02, 20, 20, 00 do
#        glycated_haemoglobin = create(:glycated_haemoglobin)
#        page.driver.header 'Accept', 'application/json'
#        get 'index'
#      end
#    end
#  end
end
