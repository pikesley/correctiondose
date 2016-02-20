describe GlycatedHaemoglobinsController, type: :controller do
  before :each do
    sign_in
  end

  describe 'GET #index' do
    it 'populates an array of hba1c values' do
      glycated_haemoglobin = create(:glycated_haemoglobin)
      get :index
      expect(assigns(:metrics)).to eq [glycated_haemoglobin]
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end
  end
end
