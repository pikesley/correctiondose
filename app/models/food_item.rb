class FoodItem < ActiveRecord::Base
  def self.short_name
    'Food item'
  end

  validates :source, presence: true
  validates :name, presence: true

  validates_uniqueness_of :source, scope: [:name]
end
