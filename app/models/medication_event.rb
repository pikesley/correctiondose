class MedicationEvent < ActiveRecord::Base
  validates :datetime, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :type, presence: true, inclusion: { in: [ 'humalog', 'lantus' ] }
end
