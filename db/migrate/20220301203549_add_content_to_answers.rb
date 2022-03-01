class AddContentToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :content, :text
  end
end
