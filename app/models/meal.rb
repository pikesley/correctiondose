class Meal < ActiveRecord::Base
  has_many :food_combinations
  has_many :food_items, through: :food_combinations
end
