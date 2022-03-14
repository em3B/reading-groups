class AddDailyReadingToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_reference :answers, :daily_reading, foreign_key: true
  end
end
