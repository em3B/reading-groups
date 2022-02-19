class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :daily_reading_id

      t.timestamps
    end
  end
end
