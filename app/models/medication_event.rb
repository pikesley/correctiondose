class MedicationEvent < ActiveRecord::Base
  def self.insulins
    [
      'humalog',
      'lantus'
    ]
  end

  def self.fields
    [
      'dose',
      'insulin'
    ]
  end

  validates :datetime, presence: true
  validates :dose, presence: true, numericality: { greater_than: 0 }
  validates :insulin, presence: true, inclusion: { in: insulins }
end
