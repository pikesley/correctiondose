class CreatePhysicalExercises < ActiveRecord::Migration
  def change
    create_table :physical_exercises do |t|
      t.datetime :datetime
      t.float :duration
      t.string :description

      t.timestamps null: false
    end
  end
end
