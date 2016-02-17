class AddCarbsToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :carbohydrate, :decimal
  end
end
