class GlucoseMeasurement < ActiveRecord::Base
  def self.fields
    [
      'value'
    ]
  end

  validates :datetime, presence: true
  validates :value, presence: true, numericality: { greater_than: 0 }
end
