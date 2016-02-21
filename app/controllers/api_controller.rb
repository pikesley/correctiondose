class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token
  http_basic_authenticate_with name: "#{ENV['API_USER']}", password: "#{ENV['API_PASSWORD']}"

  def create
    data = params['data']
    data = JSON.parse(data) if data.is_a? String
    k = {}
    k['datetime'] = data['datetime']

    case data['type']
      when 'Glucose'
        k['value'] = data['value']
        metric = GlucoseMeasurement.new k

      when 'Medication'
        k['dose'] = data['value']
        k['insulin'] = data['subtype'].downcase
        metric = MedicationEvent.new k

      when 'Food'
        k['weight'] = data['value']
        metric = CarbohydrateIntake.new k

      when 'Exercise'
        k['duration'] = data['value']
        k['description'] = data['subtype'].downcase
        metric = PhysicalExercise.new k

      when 'HbA1c'
        k['percentage'] = data['value']
        metric = GlycatedHaemoglobin.new k

      when 'Blood Pressure'
        k['reading'] = data['value']
        metric = BloodPressure.new k
    end

    if metric.save
      render json: metric, status: :ok and return
    else
      render json: k, status: 400 and return
    end
  end
end
