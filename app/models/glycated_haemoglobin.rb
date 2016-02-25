class GlycatedHaemoglobin < ActiveRecord::Base
  include PresenterExtension

  def self.short_name
    'HbA1c'
  end

  validates :datetime, presence: true
  validates :percentage, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :datetime
  default_scope { order('datetime DESC') }
end
