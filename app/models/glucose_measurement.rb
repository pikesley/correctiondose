class GlucoseMeasurement < ActiveRecord::Base
  validates :datetime, presence: true
  validates :value, presence: true, numericality: { greater_than: 0 }
end
