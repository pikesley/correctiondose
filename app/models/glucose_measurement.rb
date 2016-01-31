class GlucoseMeasurement < ActiveRecord::Base
  def self.short_name
    'Glucose'
  end

  def self.units
    {
      full: 'millimoles per Litre',
      short: 'mmol/L',
      applies_to: :value
    }
  end

  def self.fields
    [
      'value'
    ]
  end

  validates :datetime, presence: true
  validates :value, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :datetime
  default_scope { order('datetime DESC') }

  def to_builder
    Jbuilder.new do |glucose|
      glucose.(self, :datetime, :value)
    end
  end
end
