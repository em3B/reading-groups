class CreateDailyReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_readings do |t|
      t.references :text, null: false, foreign_key: true
      t.references :reading_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
