class BloodPressure < ActiveRecord::Base
  include PresenterExtension

  def self.short_name
    'Blood Pressure'
  end

  validates :datetime, presence: true
  validates :reading, presence: true
  validates_format_of :reading, with: /[0-9]+\/[0-9]+/
  validates_uniqueness_of :datetime
  default_scope { order('datetime DESC') }
end
