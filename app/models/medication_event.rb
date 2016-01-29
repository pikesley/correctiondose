class MedicationEvent < ActiveRecord::Base
  def self.insulins
    [
      'humalog',
      'lantus'
    ]
  end

  def self.fields
    [
      'amount',
      'insulin'
    ]
  end

  validates :datetime, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :insulin, presence: true, inclusion: { in: insulins }
end
