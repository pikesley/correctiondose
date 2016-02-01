class FoodItem < ActiveRecord::Base
  validates :source, presence: true
  validates :name, presence: true

  validates_uniqueness_of :source, scope: [:name]
end
