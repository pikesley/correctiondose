class ApiController < ApplicationController
  def create
    j = JSON.parse params[:json]
    k = {}
    k['datetime'] = j['datetime']

    case j['type']
      when 'Glucose'
        k['value'] = j['value']
        g = GlucoseMeasurement.new k

      when 'Medication'
        k['dose'] = j['value']
        k['insulin'] = j['subtype'].downcase
        g = MedicationEvent.new k
    end

    if g.save
      render json: g, status: :ok
    else
      render json: k, status: 400
    end
  end
end
