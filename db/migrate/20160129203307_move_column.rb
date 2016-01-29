class MoveColumn < ActiveRecord::Migration
  def change
    change_column :medication_events, :dose, :float, after: :insulin
  end
end
