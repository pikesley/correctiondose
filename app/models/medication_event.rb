class MedicationEvent < ActiveRecord::Base
# this didn't work http://stackoverflow.com/questions/14113057/how-to-have-a-drop-down-select-field-in-a-rails-form
  validates :datetime, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :insulin, presence: true, inclusion: { in: [ 'humalog', 'lantus' ] }
end
