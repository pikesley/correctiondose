class FoodCombination < ActiveRecord::Base
  belongs_to :meal
  belongs_to :food_item 
end
