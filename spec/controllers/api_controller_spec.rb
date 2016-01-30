describe ApiController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new glucose measurement' do
        expect {
          post :create, json:
          {
            "id":"3648",
            "datetime":"2016-01-30T13:58:31+00:00",
            "type":"Glucose",
            "subtype"=>{},
            "category":"Lunch",
            "value":"12.0"
          }.to_json
        }.to change(GlucoseMeasurement, :count).by 1
      end

      it 'fails with duff values' do
        expect {
          post :create, json:
          {
            "datetime":"2016-01-30T13:58:31+00:00",
            "type":"Glucose",
            "value":"0"
          }.to_json
        }.to_not change(GlucoseMeasurement, :count)
      end
    end
  end
end
