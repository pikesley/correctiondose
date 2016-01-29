class CreateCarbohydrateIntakes < ActiveRecord::Migration
  def change
    create_table :carbohydrate_intakes do |t|
      t.datetime :datetime
      t.float :weight
      t.string :description

      t.timestamps null: false
    end
  end
end
