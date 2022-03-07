class AddCoverToDailyReading < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_readings, :cover, :string
  end
end
