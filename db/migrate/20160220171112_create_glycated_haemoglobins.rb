class CreateGlycatedHaemoglobins < ActiveRecord::Migration
  def change
    create_table :glycated_haemoglobins do |t|
      t.datetime :datetime
      t.float :percentage

      t.timestamps null: false
    end
  end
end
