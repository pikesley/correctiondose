describe PhysicalExercisesController, type: :controller do
  before :each do
    sign_in
  end

  describe 'GET #index' do
    it 'populates an array of physical exercises' do
      physical_exercise = create(:physical_exercise)
      get :index
      expect(assigns(:metrics)).to eq [physical_exercise]
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested exercise to @metric' do
      physical_exercise = create(:physical_exercise)
      get :show, id: physical_exercise
      expect(assigns(:metric)).to eq physical_exercise
    end

    it 'renders the #show view' do
      get :show, id: create(:physical_exercise)
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new exercise' do
        expect {
          post :create, physical_exercise: attributes_for(:physical_exercise)
        }.to change(PhysicalExercise, :count).by 1
      end

      it 'redirects to the front page' do
        post :create, physical_exercise: attributes_for(:physical_exercise)
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new exercise' do
        expect {
          post :create, physical_exercise: attributes_for(:invalid_physical_exercise)
        }.to_not change(PhysicalExercise, :count)
      end

      it 're-renders the #new view' do
        post :create, physical_exercise: attributes_for(:invalid_physical_exercise)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    let (:test_exercise) { create :physical_exercise, datetime: '1974-06-15 22:00:00', duration: 60, description: 'drumming' }

    context 'valid attributes' do
      it 'locates the requested exercise' do
        put :update, id: test_exercise, physical_exercise: attributes_for(:physical_exercise)
        expect(assigns :metric).to eq test_exercise
      end

      it 'changes test_exercise`s attributes' do
        put :update, id: test_exercise,
                     physical_exercise: attributes_for(:physical_exercise,
                                                         datetime: '1975-06-15 22:00:00',
                                                         duration: 45,
                                                         insulin: 'drumming')
        test_exercise.reload
        expect(test_exercise.datetime).to eq '1975-06-15 22:00:00'
        expect(test_exercise.duration).to eq 45
      end

      it 'redirects to the index page' do
        put :update, id: test_exercise, physical_exercise: attributes_for(:physical_exercise)
        expect(assigns :metric).to eq test_exercise
        expect(response).to redirect_to physical_exercises_url
      end
    end

    context 'invalid attributes' do
      it 'locates the requested exercise' do
        put :update, id: test_exercise, physical_exercise: attributes_for(:invalid_physical_exercise)
        expect(assigns(:metric)).to eq test_exercise
      end

      it 'does not change the test_exercise attributes' do
        put :update, id: test_exercise,
                     physical_exercise: attributes_for(:physical_exercise,
                                                         datetime: nil,
                                                         duration: 120,
                                                         description: 'drumming')
        test_exercise.reload
        expect(test_exercise.duration).to_not eq 120
        expect(test_exercise.datetime).to eq '1974-06-15 22:00:00'
      end

      it 're-renders the #edit view' do
        put :update, id: test_exercise, physical_exercise: attributes_for(:invalid_physical_exercise)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let! (:test_exercise) { create :physical_exercise }
    it 'deletes the event' do
      expect {
        delete :destroy, id: test_exercise
      }.to change(PhysicalExercise, :count).by -1
    end

    it 'redirects to #index' do
      delete :destroy, id: test_exercise
      expect(response).to redirect_to root_url
    end
  end
end
