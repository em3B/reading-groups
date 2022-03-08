class AddObjectiveToDailyReading < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_readings, :objective, :text
  end
end
