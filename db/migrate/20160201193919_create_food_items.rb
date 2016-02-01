class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :source
      t.string :name

      t.timestamps null: false
    end
  end
end
