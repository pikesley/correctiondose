class FoodItem < ActiveRecord::Base
  has_many :food_combinations
  has_many :meals, through: :food_combinations

  def self.short_name
    'Food item'
  end

  validates :source, presence: true
  validates :name, presence: true
  validates_uniqueness_of :source, scope: [:name]
end
