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
        g = GlucoseMeasurement.new k

      when 'Medication'
        k['dose'] = data['value']
        k['insulin'] = data['subtype'].downcase
        g = MedicationEvent.new k
    end

    if g.save
      render json: g, status: :ok and return
    else
      render json: k, status: 400 and return
    end
  end
end
