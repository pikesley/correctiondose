class AmountToDose < ActiveRecord::Migration
  def change
    rename_column :medication_events, :amount, :dose
  end
end
