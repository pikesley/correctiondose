describe ApiController, type: :controller do
  describe 'POST #create' do
    before :each do
      DatabaseCleaner.clean
      user = ENV['API_USER']
      pw = ENV['API_PASSWORD']
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
    end

    context 'with valid attributes' do
      it 'creates a new glucose measurement' do
        expect {
          post :create, data: {
            "id":"3648",
            "datetime":"2016-01-30T13:58:31+00:00",
            "type":"Glucose",
            "subtype"=>{},
            "category":"Lunch",
            "value":"12.0"
          }.to_json
        }.to change(GlucoseMeasurement, :count).by 1

        expect(GlucoseMeasurement.first.value).to eq 12.0
        expect(GlucoseMeasurement.first.datetime).to eq '2016-01-30T13:58:31+00:00'
      end

      it 'fails with duff values' do
        DatabaseCleaner.clean

        expect {
          post :create, data:
          {
            "datetime":"2016-01-30T13:58:31+00:00",
            "type":"Glucose",
            "value":"0"
          }.to_json
        }.to_not change(GlucoseMeasurement, :count)
      end

      it 'creates a new meds event' do
        DatabaseCleaner.clean

        expect {
          post :create, data: {
            "id":"3649",
            "datetime":"2016-01-30T14:05:00+00:00",
            "type":"Medication",
            "subtype":"Humalog",
            "category":"Lunch",
            "value"=>"6.0"
          }.to_json
        }.to change(MedicationEvent, :count).by 1

        expect(MedicationEvent.first.insulin).to eq 'humalog'
      end
    end
  end
end
