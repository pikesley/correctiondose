class PhysicalExercise < ActiveRecord::Base
  def self.short_name
    'Exercise'
  end

  validates :datetime, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :datetime
  default_scope { order('datetime DESC') }
end
