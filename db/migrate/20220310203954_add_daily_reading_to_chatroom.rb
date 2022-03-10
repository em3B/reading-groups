class AddDailyReadingToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :daily_reading, foreign_key: true
  end
end
