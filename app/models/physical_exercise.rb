class PhysicalExercise < ActiveRecord::Base
  def self.fields
    [
      'duration',
      'description'
    ]
  end

  validates :datetime, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
end
