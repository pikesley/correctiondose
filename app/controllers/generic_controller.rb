class GenericController < ApplicationController
  before_action :require_login

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
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @metric = find_class.find(params[:id])

    if @metric.update(acceptable_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @metric = find_class.find(params[:id])
    @metric.destroy

    redirect_to root_path
  end

  private

  def find_class
    params[:controller].classify.constantize
  end

  def metrics_path
    send("#{@metric.class.name.underscore}s_path".to_sym)
  end
end
