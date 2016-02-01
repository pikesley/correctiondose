describe FoodItemsController, type: :controller do
  before :each do
    sign_in
  end

  describe 'GET #index' do
    it 'populates an array of medication events' do
      food_item = create(:food_item)
      get :index
      expect(assigns(:metrics)).to eq [food_item]
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new measurement' do
        expect {
          post :create, food_item: attributes_for(:food_item)
        }.to change(FoodItem, :count).by 1
      end

      it 'redirects to the front page' do
        post :create, food_item: attributes_for(:food_item)
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new item' do
        expect {
          post :create, food_item: attributes_for(:invalid_food_item)
        }.to_not change(FoodItem, :count)
      end

      it 're-renders the #new view' do
        post :create, food_item: attributes_for(:invalid_food_item)
        expect(response).to render_template :new
      end
    end
  end
end
