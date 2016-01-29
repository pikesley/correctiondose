class CarbohydrateIntakesController < GenericController
  private

  def metrics_path
    carbohydrate_intakes_path
  end

  def acceptable_params
    params.require(:carbohydrate_intake).permit(:datetime, :weight, :description)
  end
end
