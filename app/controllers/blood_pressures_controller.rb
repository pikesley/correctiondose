class BloodPressuresController < GenericController
  def create
    super longterm_index_path
  end

  def update
    super longterm_index_path
  end
  
  private

  def acceptable_params
    params.require(:blood_pressure).permit(:datetime, :reading)
  end
end
