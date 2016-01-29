class MoveColumn < ActiveRecord::Migration
  def change
    change_column :medication_events, :amount, :float, after: :insulin
  end
end
