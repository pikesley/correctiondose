class FoodItemsController < GenericController
  private

  def acceptable_params
    params.require(:food_item).permit(:source, :name)
  end
end
