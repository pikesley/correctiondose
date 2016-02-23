class GlucoseMeasurement < ActiveRecord::Base
  def self.short_name
    'Glucose'
  end

  validates :datetime, presence: true
  validates :value, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :datetime
  default_scope { order('datetime DESC') }
end
