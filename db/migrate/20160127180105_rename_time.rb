class RenameTime < ActiveRecord::Migration
  def change
    rename_column :glucose_measurements, :time, :datetime
  end
end
