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
            "subtype":{},
            "category":"Lunch",
            "value":"12.0"
          }.to_json
        }.to change(GlucoseMeasurement, :count).by 1

        expect(GlucoseMeasurement.first.value).to eq 12.0
        expect(GlucoseMeasurement.first.datetime).to eq '2016-01-30T13:58:31+00:00'
      end

      it 'fails with duff values' do
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
        expect {
          post :create, data: {
            "id":"3649",
            "datetime":"2016-01-30T14:05:00+00:00",
            "type":"Medication",
            "subtype":"Humalog",
            "category":"Lunch",
            "value":"6.0"
          }.to_json
        }.to change(MedicationEvent, :count).by 1

        expect(MedicationEvent.first.insulin).to eq 'humalog'
      end

      it 'creates a new carbs intake' do
        expect {
          post :create, data: {
            "id":"3650",
            "datetime":"2016-01-29T19:01:46+00:00",
            "type":"Food",
            "subtype":{},
            "category":"Dinner",
            "value":"70.0"
          }.to_json
        }.to change(CarbohydrateIntake, :count).by 1
      end

      it 'creates a new exercise' do
        expect {
          post :create, data: {
            "id":"3651",
            "datetime":"2016-01-20T19:02:13+00:00",
            "type":"Exercise",
            "subtype":"Drumming",
            "category":"Dinner",
            "value":"180.0"
          }.to_json
        }.to change(PhysicalExercise, :count).by 1
      end

      it 'does not create duplicates' do
        expect {
          2.times do
            post :create, data: {
              "id":"3645",
              "datetime":"2016-01-30T01:46:26+00:00",
              "type":"Medication",
              "subtype":"Lantus",
              "category":"Bedtime",
              "value":"14.0"
            }
          end
        }.to change(MedicationEvent, :count).by 1
      end
    end
  end
end
