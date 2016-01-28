class CreateMedicationEvents < ActiveRecord::Migration
  def change
    create_table :medication_events do |t|
      t.datetime :datetime
      t.string :type
      t.float :amount

      t.timestamps null: false
    end
  end
end
