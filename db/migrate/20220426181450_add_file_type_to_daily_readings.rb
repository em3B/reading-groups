class AddFileTypeToDailyReadings < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_readings, :file_type, :boolean
  end
end
