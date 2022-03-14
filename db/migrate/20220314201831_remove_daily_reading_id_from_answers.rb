class RemoveDailyReadingIdFromAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :daily_reading_id, :integer
  end
end
