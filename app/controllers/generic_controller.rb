class GenericController < ApplicationController
  before_action :require_login

  def index
    @hours = 72
    if params[:hours]
      @hours = hours(params[:hours]) ? hours(params[:hours]) : @hours
    end

    @model = find_class
    @metrics = @model.where(datetime: (Time.now - @hours.hours)..Time.now)

    if @metrics == []
      @metrics = @model.first(3)
    end

    @bucketed_metrics = @metrics.group_by { |g| g.datetime.strftime "%Y-%m-%d" }

    @with_year = begin
      @metrics.first.datetime.year < Time.now.year
    rescue NoMethodError
      nil
    end

    @no_picker = begin
      ((Time.now - @metrics.first.datetime) / 3600) > 168
    rescue NoMethodError
      true
    end

    @has_charts = false
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

  def create redirect_path = root_path
    @metric = find_class.new(acceptable_params)
    if @metric.save
      redirect_to redirect_path
    else
      render :new
    end
  end

  def update redirect_path = root_path
    @metric = find_class.find(params[:id])

    if @metric.update(acceptable_params)
      redirect_to redirect_path
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

  def hours parameter
    # hours since 1970-01-01 i.e. FOREVER
    return ((Time.now.strftime "%s").to_i / 3600) if parameter == '0'
    return parameter.to_i if parameter.to_i > 0
  end
end
