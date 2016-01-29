class CarbohydrateIntake < ActiveRecord::Base
  validates :datetime, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
end
