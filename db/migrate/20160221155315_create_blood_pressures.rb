class CreateBloodPressures < ActiveRecord::Migration
  def change
    create_table :blood_pressures do |t|
      t.datetime :datetime
      t.string :reading

      t.timestamps null: false
    end
  end
end
