class CreateGlucoseMeasurements < ActiveRecord::Migration
  def change
    create_table :glucose_measurements do |t|
      t.timestamp :time
      t.float :value

      t.timestamps null: false
    end
  end
end
