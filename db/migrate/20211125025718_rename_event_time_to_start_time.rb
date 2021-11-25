class RenameEventTimeToStartTime < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :time, :start_time
  end
end
