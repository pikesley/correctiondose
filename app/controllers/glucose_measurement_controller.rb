class GlucoseMeasurementController < ApplicationController
  before_action :require_login

  def index
    @measurements = GlucoseMeasurement.all
  end
end
