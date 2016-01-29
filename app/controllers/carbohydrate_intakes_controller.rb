class CarbohydrateIntakesController < GenericController
  private
  
  def acceptable_params
    params.require(:carbohydrate_intake).permit(:datetime, :weight, :description)
  end
end
