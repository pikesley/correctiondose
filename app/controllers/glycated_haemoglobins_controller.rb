class GlycatedHaemoglobinsController < GenericController
  def create
    super longterm_index_path
  end

  def update
    super longterm_index_path
  end

  private

  def acceptable_params
    params.require(:glycated_haemoglobin).permit(:datetime, :percentage)
  end
end
