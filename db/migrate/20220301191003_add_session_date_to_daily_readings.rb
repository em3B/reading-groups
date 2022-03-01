class AddSessionDateToDailyReadings < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_readings, :session_date, :date
  end
end
