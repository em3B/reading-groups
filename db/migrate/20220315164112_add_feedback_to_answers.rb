class AddFeedbackToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :feedback, :text
  end
end
