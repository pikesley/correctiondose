class GlycatedHaemoglobin < ActiveRecord::Base
  def self.short_name
    'HbA1c'
  end

  def self.units
    {
      full: 'percent',
      short: '%',
      applies_to: :percentage
    }
  end

  def self.fields
    [
      'percentage'
    ]
  end

  validates :datetime, presence: true
  validates :percentage, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :datetime
  default_scope { order('datetime DESC') }
end
