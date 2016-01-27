class GlucoseMeasurement < ActiveRecord::Base
  validates :datetime, presence: true
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
