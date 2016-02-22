class CarbohydrateIntake < ActiveRecord::Base
  def self.short_name
    'Carbs'
  end

  def self.fields
    [
      'weight',
      'description'
    ]
  end

  validates :datetime, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :datetime
  default_scope { order('datetime DESC') }
end
