class GenericController < ApplicationController
  def index
    @metrics = find_class.all
  end

  def show
    @metric = find_class.all.find(params[:id])
  end

  def new
    @glucose_measurement = find_class.new
  end

  private

  def find_class
    params[:controller].classify.constantize
  end
end
