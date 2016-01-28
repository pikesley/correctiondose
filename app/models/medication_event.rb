class MedicationEvent < ActiveRecord::Base
  def self.insulins
    [
      'humalog',
      'lantus'
    ]
  end

  validates :datetime, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :insulin, presence: true, inclusion: { in: insulins }
end
