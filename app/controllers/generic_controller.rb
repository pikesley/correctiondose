class GenericController < ApplicationController
  def index
    @metrics = find_class.all
  end

  def show
    @metric = find_class.all.find(params[:id])
  end

  def new
    @metric = find_class.new
  end

  def edit
    @metric = find_class.find(params[:id])
  end

  def create
    @metric = find_class.new(acceptable_params)
    if @metric.save
      redirect_to glucose_measurements_path
    else
      render :new
    end
  end

  private

  def find_class
    params[:controller].classify.constantize
  end
end
