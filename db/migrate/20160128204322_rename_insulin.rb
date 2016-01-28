class RenameInsulin < ActiveRecord::Migration
  def change
    rename_column :medication_events, :type, :insulin
  end
end
