class MedicationEvent < ActiveRecord::Base
  include PresenterExtension

  def self.short_name
    'Meds'
  end

  def self.insulin_types
    [
      'humalog',
      'lantus'
    ]
  end

  validates :datetime, presence: true
  validates :dose, presence: true, numericality: { greater_than: 0 }
  validates :insulin, presence: true, inclusion: { in: insulin_types }
  validates_uniqueness_of :datetime
  default_scope { order('datetime DESC') }
end
