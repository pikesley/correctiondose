class PhysicalExercise < ActiveRecord::Base
  def self.short_name
    'Exercise'
  end

  def self.units
    {
      full: 'Minutes',
      short: 'mins',
      applies_to: :duration
    }
  end

  def self.fields
    [
      'duration',
      'description'
    ]
  end

  validates :datetime, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :datetime
  default_scope { order('datetime DESC') }
end
