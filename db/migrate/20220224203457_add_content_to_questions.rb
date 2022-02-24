class AddContentToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :content, :text
  end
end
