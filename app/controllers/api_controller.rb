class ApiController < ApplicationController
  def create
    j = JSON.parse params[:json]

    k = {}
    k['datetime'] = j['datetime']
    k['value'] = j['value']

    g = GlucoseMeasurement.new k
    if g.save
      render json: g, status: :ok
    else
      render json: k, status: 400
    end
  end
end
