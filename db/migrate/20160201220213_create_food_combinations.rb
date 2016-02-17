class CreateFoodCombinations < ActiveRecord::Migration
  def change
    create_table :food_combinations do |t|
      t.belongs_to :meal, index: true
      t.belongs_to :food_item, index: true
      t.datetime :occurence
      t.timestamps null: false
    end
  end
end
