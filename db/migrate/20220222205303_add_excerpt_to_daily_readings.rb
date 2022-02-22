class AddExcerptToDailyReadings < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_readings, :excerpt, :text
  end
end
